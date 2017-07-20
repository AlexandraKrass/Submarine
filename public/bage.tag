<bage>

<div class="form1">
<P> Данные о продажах подводных лодок </P> 				 
<div class="client2">
<button ref="button" type="button" id='btn' class="btn" onclick={ list }>  Получить </button>
<h3> <label>Total:</label> { total }</h3></div> 

  <style>
   table {
    table-layout: fixed; 
    width: 40%; /* ширина табл */
   }
   .col1 { width: 100px; }
   .coln { width: 70px; }
  </style>
</div>

 <virtual each={ item in items}>
    <list data={item} ></list>
  </virtual>



<script>
	
	var tag = this
	tag.total = ""
	tag.items = []
	
	var btn;

	tag.on('mount', function(){
		
		btn = tag.refs.button
	
	})

	tag.list = function(){
		
		var url = '/calculation'
	  	var data = { name : name }
/// { sell:[], total: 3}
	  	var onresponse = function( data ) {
	  		tag.items = data.sell
	  		tag.total = data.total
	  		tag.update()
	  	}
	  	$.post( url, data ).done( onresponse )
	}

</script>


</bage>