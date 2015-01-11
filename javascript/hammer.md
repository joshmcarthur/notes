
Has a `Manager` instance which contains a number of `Recognizer` instances

The manager manages the given DOM element. it

1. sets up the "input event listeners"
2. sets the "touch action property" on the _element_


```js

mc.remove('rotate') // remove a recognizer from the manager

mc.on('panleft', somefunc) // listen to the event generated by the recognizers
```

The recognizers generate events which we then listen to with `on`
These events are NOT DOM events by default

Anatomy of a hammer event

* is a vanilla JS object
* contains `srcEvent` property which is a of type TouchEvent, MouseEvent or PointerEvent.
* has an 'isFirst' and 'isFinal' property


# TouchEvent

