Class {
	#name : 'LNLinkNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN-Tests',
	#package : 'SimpleLAN-Tests'
}

{ #category : 'tests' }
LNLinkNodeTest >> testHasNextNode [

	self deny: LNLinkNode new hasNextNode
]

{ #category : 'tests' }
LNLinkNodeTest >> testPrintingJustInitializedNode [

	self assert: LNLinkNode new printString equals: 'unamed -> /'
]

{ #category : 'tests' }
LNLinkNodeTest >> testPrintingWithANextNode [

	self
		assert: (LNLinkNode new
				 name: #LNNode1;
				 nextNode: (LNLinkNode new name: #PC1)) printString
		equals: 'LNNode1 -> PC1'
]

{ #category : 'tests' }
LNLinkNodeTest >> testPrintingWithoutNextNode [

	self
		assert: (LNLinkNode new
				 name: #LNNode1;
				 printString)
		equals: 'LNNode1 -> /'
]

{ #category : 'tests' }
LNLinkNodeTest >> testSendLog [

	| mockLogStream node1 node2 |
	mockLogStream := WriteStream on: (String new: 1000).
	node1 := LNLinkNode new name: 'Node 1'.
	node2 := LNLinkNode new name: 'Node 2'.
	node1 nextNode: node2.
	node1 logStream: mockLogStream.

	node1 send: LNPacket new.

	self
		assert: mockLogStream contents
		equals: 'Node 1 sends a packet to: Node 2' , Character cr asString
]
