Class {
	#name : 'LNWorkstation',
	#superclass : 'LNNode',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'examples' }
LNWorkstation class >> example [

	<script>
	(LNWorkstation new
		 name: 'Mac';
		 nextNode: (LNNode new name: 'PC1'; nextNode: (LNWorkstation new
		 name: 'Mac2'; yourself); yourself)) 
		accept:
		(LNPacket new addresseeName: 'Mac')
]

{ #category : 'examples' }
LNWorkstation class >> example2 [

	<script>
	(LNWorkstation new
		 name: 'Mac';
		 nextNode: (LNNode new
				  name: 'PC1';
				  nextNode: (LNWorkstation new
						   name: 'Mac2';
						   yourself);
				  yourself)) accept: (LNPacket new addresseeName: 'Mac2')
]

{ #category : 'examples' }
LNWorkstation class >> example3 [

	<script>
	(LNWorkstation new
		 name: 'Mac';
		 nextNode: (LNNode new
				  name: 'PC1';
				  nextNode: (LNWorkstation new
						   name: 'Mac2';
						   yourself);
				  yourself)) emit: (LNPacket new addresseeName: 'Mac2')
]

{ #category : 'testing' }
LNWorkstation >> emit: aPacket [

	self send: aPacket
]

{ #category : 'testing' }
LNWorkstation >> treatPacket: aPacket [

	(logStream << self name)
		<< ' accepted packet';
		cr;
		flush
]
