pragma solidity >=0.7.0 <0.9.0;

contract MyErc20 {
    string Name = "";
    string Symbol = "";
    uint8 Decimals = 8;
    uint256 TotalSupply = 10000000;
    address deployer;

    mapping(address => uint256) balances;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval (address indexed _owner, address indexed _to, uint256 _value);


    constructor() {
        deployer = msg.sender;
        balances[deployer] = 1000000 * 1e8;
    }

    function name() public view returns (string memory) {
        return Name;
    }

    function symbol() public view returns (string memory) {
        return Symbol;
    }

    function decimals() public view returns (uint8) {
        return Decimals;
    }

    function totalSupply() public view returns (uint256) {
        return TotalSupply; //10M
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        assert(balances[msg.sender] > _value);
        balances[msg.sender] = balances[msg.sender] - _value;
        balances[_to] = balances[_to] + _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        if (balances[_from] < _value) {
            return false;
        }
        if (allowances[_from][msg.sender] < _value) return false;

        balances[_from] -= _value;
        balances[_to] += _value;
        allowances[_from][msg.sender] -= _value;
        return true;
    }

    mapping(address => mapping(address => uint256)) allowances;

    function approve(address _spender, uint256 _value)
        public
        returns (bool success)
    {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _to, _value);
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256 remaining)
    {
        return allowances[_owner][_spender];
    }

    mapping(uint256 => bool) BlockMined;
    uint256 totalMinted = 1000000 * 1e8;

    function mine() public returns (bool success) {
        // Check if the reward has already been given to someone
        if (BlockMined[block.number]) {
            return false;
        }
        // Check if the current block number is a multiple of 10
        if (block.number % 10 != 0) {
            return false;
        }
        // If the reward has not yet been given out, claim it!
        balances[msg.sender] += 10 * 1e8;
        totalMinted += 10 * 1e8;
        BlockMined[block.number] = true;
        return true;
    }

    function getCurrentBlock() public view returns (uint256) {
        return block.number;
    }

    function isMinted() public view returns (bool) {
        return BlockMined[block.number];
    }
}
