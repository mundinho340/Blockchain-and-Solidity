// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    // Variáveis de armazenamento público para as três partes envolvidas
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // Construtor que recebe o endereço do árbitro e do beneficiário
    constructor(address _arbiter, address _beneficiary) {
        // O depositante é o endereço que implanta o contrato
        depositor = msg.sender;

        // Inicializando o beneficiário e o árbitro com os argumentos fornecidos
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }
}
