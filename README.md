A mechanism to let the responder chain handle the presentation of errors on iOS, inspired by similar code in AppKit.

Overview
--------
 
When an error is received, the handler can simply send a -presentError: message to the deepest related UIResponder instance (like a view or a view controller).
 
Responders of the chain will have a chance to handle the error in a custom way - or to forward the message to the next responder (by calling the default UIResponder implementation).

If the message reaches UIApplication (the last item of the responder chain), the error will be presented as a standard UIAlertView.
 
Usage
-----

When you need to present an error to the user, send a message to the deepest related UIResponder instance.

For instance, to report an error that relates to the current view controller:

     // In a custom UIViewController subclass
     -(void) connectionDidFailWithError:(NSError*)error
     {
         [self presentError:error];
     }

Other example, to report an error that relates to a specific view:

      -(void) updateDidFailForView:(UIView*)view withError:(NSError*)error
      {
          [view presentError:error];
      }

The -presentError: message will bubble up the responder chain until it is handled by an UIView,
an UIViewController or the top UIApplication.

Customizing error presentation
------------------------------

Sometimes you need to present some errors in a different way; or you want a component to display all errors that go through it in a specific fashion. In that case, just override the -presentError: method on this component.

In the method, you can probe the error and the environnement to determine whether your custom presentation applies or not. If it does, your code should handle the case — and if it doesn't, let the message continue its way by calling `[super presentError:error]`.

For instance, a UIViewController could decide to present errors in a non-modal way, but only if it is currently visible.

To do this, you can write something like:

    // In a custom UIViewController subclass
    - (void) presentError:(NSError*)error
    {
        BOOL isVisible = [self isViewLoaded] && [[self view] window];
        if (isVisible)
            [self showLabelWithError:error]; // to be implemented on MyCustomViewController
        else
            [super presentError:error]; // let the error go through the responder chain
    }

You can even use a category on UIViewController to add this behavior on all view controllers.

Notes
-----

If the responder chain is cut (for instance if a subtree of views is removed and is no longer attached to a window), the errors of this subtree may not be presented at all (as errors never reach UIApplication).

This is often the desired behavior, as it means the UI element the error is attached to is no longer visible to the user; most of the time presenting an error message is then irrelevant.

However, if you need to ensure any error will be eventually presented, you should check if the responder chain goes up to a UIWindow, and present the error directly on UIApplication otherwise.

    if (view.window)
        [view presentError:error];
    else
        [[UIApplication sharedApplication] presentError:error];
        
References
----------

This mechanism looks much like the `-presentError:` of AppKit — except it's much simpler. Only a subset of the original API is implemented; there is no `-willPresentError:`, no forwarding to the app delegate and no handling of cut responder chains.

It is also much simpler to understand, fits in ten lines of code, and can satisfy your own needs.

Another re-implementation is available at [github.com/hectr/ErrorKit](https://github.com/hectr/ErrorKit). You can also read the [documentation of the original AppKit mechanism](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ErrorHandlingCocoa/ErrorRespondRecover/ErrorRespondRecover.html#//apple_ref/doc/uid/TP40001806-CH203-CJBHABAA).



