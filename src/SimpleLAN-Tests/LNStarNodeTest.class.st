Class {
	#name : 'LNStarNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNStarNodeTest >> testDefaultName [

	self assert: LNStarNode new name equals: 'hub'
]

{ #category : 'tests' }
LNStarNodeTest >> testSend [

	| starNode |
	starNode := LNStarNode new
]
