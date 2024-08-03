Class {
	#name : 'LNNodeTest',
	#superclass : 'TestCase',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'tests' }
LNNodeTest >> testHasNextNode [

	self deny: LNNode new hasNextNode
]

{ #category : 'tests' }
LNNodeTest >> testName [

	| node |
	node := LNNode new.
	node name: #PC1.
	self assert: node name equals: #PC1
]

{ #category : 'tests' }
LNNodeTest >> testPrintingJustInitializedNode [

	self assert: LNNode new printString equals: 'unamed -> /'
]

{ #category : 'tests' }
LNNodeTest >> testPrintingWithANextNode [

	self
		assert: (LNNode new
				 name: #LNNode1;
				 nextNode: (LNNode new name: #PC1)) printString
		equals: 'LNNode1 -> PC1'
]

{ #category : 'tests' }
LNNodeTest >> testPrintingWithoutNextNode [

	self
		assert: (LNNode new
				 name: #LNNode1;
				 printString)
		equals: 'LNNode1 -> /'
]

{ #category : 'tests' }
LNNodeTest >> testSendLog [

	| mockLogStream node1 node2 |
	mockLogStream := WriteStream on: (String new: 1000).
	node1 := LNNode new name: 'Node 1'.
	node2 := LNNode new name: 'Node 2'.
	node1 nextNode: node2.
	node1 logStream: mockLogStream.

	node1 send: LNPacket new.

	self
		assert: mockLogStream contents
		equals: 'Node 1 sends a packet to: Node 2' , Character cr asString
]
