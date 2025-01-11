//Memory Arrays

//Unlike storage arrays, memory arrays do not have a push member function.

//Memory arrays can have a dynamic size if the size is provided during initializati/on.

//For example:

import "forge-std/console.sol";
contract Contract {
	uint x = 5;

	function createArray() view external {
		address[] memory addresses = new address[](x);
		console.log( addresses.length ); // 5
	}
}

// O tamanho é fornecido dinamicamente pela variável x.
// Poderíamos potencialmente alterar essa variável e ela
// criaria um array de endereços desse tamanho. 
// Observe o uso do operador new aqui durante a inicialização!

// Após a inicialização, os arrays de memória não podem ser redimensionados. 
// Isso significa que mesmo no exemplo acima,
// uma vez que o array de endereços é inicializado no tamanho 5,
// ele permanecerá nesse tamanho durante toda a transação.
