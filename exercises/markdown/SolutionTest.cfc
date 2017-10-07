component extends="MarkdownTest" {

	function beforeAll(){
	  SUT = createObject( 'Solution' );
	}

	function run(){
	
		describe( "My Markdown class", function(){			

			it( 'parses normal text as a paragraph', function(){
				expect( SUT.parse( input='This will be a paragraph' ) ).toBe( '<p>This will be a paragraph</p>' );
			});

			it( 'parsing italics', function(){
				expect( SUT.parse( input='_This will be italic_' ) ).toBe( '<p><em>This will be italic</em></p>' );
			});

			it( 'parsing bold text', function(){
				expect( SUT.parse( input='__This will be bold__' ) ).toBe( '<p><strong>This will be bold</strong></p>' );
			});

			it( 'mixed normal, italics and bold text', function(){
				expect( SUT.parse( input='This will _be_ __mixed__' ) ).toBe( '<p>This will <em>be</em> <strong>mixed</strong></p>' );
			});

			it( 'with h1 header level', function(){
				expect( SUT.parse( input='## This will be an h1' ) ).toBe( '<h1>This will be an h1</h1>' );
			});

			it( 'with h2 header level', function(){
				expect( SUT.parse( input='#### This will be an h2' ) ).toBe( '<h2>This will be an h2</h2>' );
			});

			it( 'with h6 header level', function(){
				expect( SUT.parse( input='############ This will be an h6' ) ).toBe( '<h6>This will be an h6</h6>' );
			});

			it( 'unordered lists', function(){
				expect( SUT.parse( input='* Item 1#chr( 10 )#* Item 2' ) ).toBe( '<ul><li><p>Item 1</p></li><li><p>Item 2</p></li></ul>' );
			});

			it( 'multiple unordered lists', function(){
				expect( SUT.parse( input='* Item 1#chr( 10 )#* Item 2#chr( 10 )##chr( 10 )####### Heading#chr( 10 )#* Item 1#chr( 10 )#* Item 2' ) ).toBe( '<ul><li><p>Item 1</p></li><li><p>Item 2</p></li></ul><h3>Heading</h3><ul><li><p>Item 1</p></li><li><p>Item 2</p></li></ul>' );
			});

			it( 'With a little bit of everything', function(){
				expect( SUT.parse( input='## Header!#chr( 10 )#* __Bold Item__#chr( 10 )#* _Italic Item_' ) ).toBe( '<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>' );
			});

		});
		
	}

}