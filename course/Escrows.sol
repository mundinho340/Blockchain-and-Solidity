// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    // Variáveis de armazenamento público para as três partes envolvidas
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // Construtor sem parâmetros que inicializa os endereços com address(0)
    constructor() {
        depositor = address(0);
        beneficiary = address(0);
        arbiter = address(0);
    }
}
