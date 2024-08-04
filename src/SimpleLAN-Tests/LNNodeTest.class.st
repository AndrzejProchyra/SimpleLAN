Class {
	#name : 'LNNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNNodeTest >> testName [

	| node |
	node := LNNode new.
	node name: #PC1.
	self assert: node name equals: #PC1
]
