// SPDX-License-Identifier: MIT
// SHOW-ONLY: Annotated ERC20 for MOI Hacks slides. Not for deployment.
// Purpose: Highlight the CONTRACT-CENTRIC model — "The contract is the bank."

pragma solidity ^0.8.0;

/**
 * On Ethereum, all token state lives INSIDE this contract.
 * The contract holds every user's balance. Users do not own their state.
 */
contract ERC20 {
    // ========== CONTRACT-CENTRIC STATE ==========
    // State lives in the CONTRACT. The contract is the bank.
    // Every user's balance is a row in this single mapping.
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) {
        _name = name_;
        _symbol = symbol_;
        _decimals = decimals_;
    }

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
     * Contract holds all balances. We LOOK UP your balance from the contract's storage.
     * You don't hold state — the contract does.
     */
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    /**
     * Transfer: we UPDATE the contract's mapping. Both sender and receiver
     * balances live in this same contract. One shared ledger = one bottleneck.
     */
    function transfer(address to, uint256 amount) public returns (bool) {
        address owner = msg.sender;
        _transfer(owner, to, amount);
        return true;
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        address owner = msg.sender;
        _approve(owner, spender, amount);
        return true;
    }

    /**
     * Again: contract-centric. We read/write the contract's _balances mapping.
     */
    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        address spender = msg.sender;
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "ERC20: transfer from zero");
        require(to != address(0), "ERC20: transfer to zero");
        require(_balances[from] >= amount, "ERC20: insufficient balance");
        unchecked {
            _balances[from] -= amount;
            _balances[to] += amount;
        }
        emit Transfer(from, to, amount);
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC20: approve from zero");
        require(spender != address(0), "ERC20: approve to zero");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _spendAllowance(address owner, address spender, uint256 amount) internal {
        uint256 current = _allowances[owner][spender];
        require(current >= amount, "ERC20: insufficient allowance");
        unchecked {
            _allowances[owner][spender] = current - amount;
        }
    }

    /**
     * Mint: we write into the CONTRACT's _balances and _totalSupply.
     * All state lives here. Contract is the bank.
     */
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20: mint to zero");
        _totalSupply += amount;
        unchecked {
            _balances[account] += amount;
        }
        emit Transfer(address(0), account, amount);
    }
}
