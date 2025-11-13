$(function(){
	$('.control-loading').remove()
	setInterval(() => {
		buscaPedidos()
	}, 4000)
})

function buscaPedidos(){
	let impressora_id = $('#impressora_id').val()

	$.get(path_url + "api/impressao-pedido", 
	{ 
		impressora_id: impressora_id
	})
	.done((data) => {
		console.log(data)
		if(data.log){
			let html = $('.logs').html()
			$('.logs').html(data.log + html)
			window.open(path_url+"impressao-pedido-comando?"+data.itens)
		}

	})
	.fail((err) => {
		console.log(err)
	})
}

