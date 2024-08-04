Class {
	#name : 'LNNode',
	#superclass : 'Object',
	#instVars : [
		'name',
		'nextNode',
		'logStream'
	],
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'testing' }
LNNode >> accept: aPacket [

	self subclassResponsibility
]

{ #category : 'initialization' }
LNNode >> initialize [

	super initialize.
	logStream := Transcript.
	name := 'unamed'
]

{ #category : 'accessing' }
LNNode >> logStream: aStream [

	logStream := aStream
]

{ #category : 'accessing' }
LNNode >> name [

	^ name
]

{ #category : 'accessing' }
LNNode >> name: aString [

	name := aString
]
