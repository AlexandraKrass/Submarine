<bage>

<div class="form2">
<P> Данные о сделки данной марки </P> 				 
<input type="text" ref='mark' value="Королева" id='mark' placeholder="Введите название" class="client2"  />
<p> 
<button ref="button" type="button" id='btn' class="btn" onclick={ list }>  Получить </button>
</p>
  <style>
   table {
    table-layout: fixed; /* Фиксированная ширина ячеек */
    width: 100%; /* Ширина таблицы */
   }
   .col1 { width: 160px; }
   .coln { width: 60px; }
  </style>
</div>

 <virtual each={ item in items}>
    <list data={item} ></list>
  </virtual>

<script>
	
	var tag = this
	tag.items = []
	
	var btn, inp;

	tag.on('mount', function(){
		
		btn = tag.refs.button
		inp = tag.refs.mark
	
	})

	tag.list = function(){
		
		var name = inp.value // submarine type
		var url = '/calculation'
	  	var data = { name : name }

	  	var onresponse = function( data ) {
	  		tag.items = data
	  		tag.update()
	  	}
	  	$.post( url, data ).done( onresponse )
	}

</script>


</bage>