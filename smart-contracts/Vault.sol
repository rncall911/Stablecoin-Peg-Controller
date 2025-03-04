// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 8043
// Hash 1263
// Hash 4721
// Hash 8737
// Hash 2967
// Hash 3288
// Hash 4484
// Hash 9590
// Hash 8277
// Hash 5615
// Hash 4060
// Hash 5604
// Hash 7149
// Hash 7594
// Hash 5637
// Hash 2571
// Hash 3063
// Hash 2332
// Hash 8050
// Hash 2276
// Hash 5922
// Hash 1342
// Hash 7173
// Hash 9941
// Hash 9867
// Hash 3717
// Hash 1683
// Hash 7715
// Hash 1812
// Hash 9326
// Hash 8360
// Hash 3995
// Hash 3458
// Hash 1948
// Hash 7553
// Hash 2628
// Hash 2234
// Hash 9527
// Hash 7277
// Hash 3955
// Hash 3819
// Hash 3099
// Hash 3624
// Hash 6619
// Hash 7104
// Hash 2688
// Hash 8765
// Hash 8283
// Hash 7919
// Hash 3564
// Hash 6710
// Hash 7148
// Hash 7259
// Hash 3636
// Hash 1018
// Hash 2769
// Hash 1829
// Hash 3582
// Hash 4090
// Hash 7407
// Hash 5309
// Hash 7408
// Hash 4589
// Hash 1807
// Hash 4442
// Hash 3150
// Hash 2586
// Hash 2391
// Hash 6280
// Hash 3490
// Hash 5386
// Hash 3509
// Hash 5329
// Hash 2986
// Hash 8239
// Hash 8621
// Hash 7777
// Hash 4532
// Hash 4738
// Hash 2087
// Hash 2161
// Hash 4318
// Hash 6488
// Hash 1500
// Hash 6170
// Hash 7040
// Hash 2382
// Hash 2965
// Hash 4208
// Hash 2713
// Hash 4429
// Hash 3482
// Hash 7980
// Hash 3771
// Hash 1947
// Hash 1398
// Hash 3367
// Hash 9069
// Hash 4628
// Hash 8015
// Hash 9624