Class {
	#name : 'MockNode',
	#superclass : 'LNNode',
	#instVars : [
		'callsToAccept'
	],
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'visiting' }
MockNode >> accept: aPacket [

	callsToAccept := callsToAccept + 1
]

{ #category : 'accessing' }
MockNode >> callsToAccept [

	^ callsToAccept
]

{ #category : 'initialization' }
MockNode >> initialize [

	super initialize.
	callsToAccept := 0
]
