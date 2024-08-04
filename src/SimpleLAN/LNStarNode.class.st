Class {
	#name : 'LNStarNode',
	#superclass : 'LNNode',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'initialization' }
LNStarNode >> initialize [

	super initialize.
	name := 'hub'
]

{ #category : 'testing' }
LNStarNode >> treatPacket: aPacket [

	^ self shouldNotImplement
]
