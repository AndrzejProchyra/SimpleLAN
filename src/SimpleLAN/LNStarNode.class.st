Class {
	#name : 'LNStarNode',
	#superclass : 'LNNode',
	#instVars : [
		'connectedNodes'
	],
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'instance creation' }
LNStarNode class >> withConnectedNodes: aCollection [

	^ self new setConnectedNodes: aCollection
]

{ #category : 'initialization' }
LNStarNode >> initialize [

	super initialize.
	name := 'hub'
]

{ #category : 'instructions' }
LNStarNode >> send: aLNPacket [

	connectedNodes do: [ :node |
		logStream << node name << ' '.
		node accept: aLNPacket ]
]

{ #category : 'initialization' }
LNStarNode >> setConnectedNodes: aCollection [

	connectedNodes := aCollection
]

{ #category : 'testing' }
LNStarNode >> treatPacket: aPacket [

	^ self shouldNotImplement
]
