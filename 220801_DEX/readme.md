## DEXを作るための勉強
- 開発言語は solidity
- 目標はDappsを作ること、NFTを発行すること

## メモ

//artifactsはコンパイルしたデータが格納されている
const ERC20 = artifacts.require("ERC20");
const Dex = artifacts.require("Dex");

//module.exports_外部のプログラムを読み込む
//async 非同期処理
//ERC20.sol -> constructor(string memory _name, string memory _symbol, uint256 _totalSupply){
//constructorで型は定義している①memory _name→Dai、②memory _symbol→DAI、uint256 _totalSupply→wei 10の10乗（ETH標記の場合はさらに18乗）
//weiの場合はstringかbigNumber型でないといけない。web3.utils.toBNというメソッドでbigNumberを定義できる

const toWei = (number) => web3.utils.toWei(web3.utils.toBN(number), "ether");

// 上記'ether'について→ 1eth = 10^18 weiなので、'ether'と書けば10^18と同じ意味になる

// module.exports = async function (deployer) {
//   await deployer.deploy(ERC20, "Dai", "DAI", web3.utils.toBN(10 ** 10 ** 10 ** 18));
//   await deployer.deploy(ERC20, "Chainlink", "LINK", web3.utils.toBN(10 ** 10 ** 10 ** 18));
//   await deployer.deploy(ERC20, "Compound", "COMP", web3.utils.toBN(10 ** 10 ** 10 ** 18));
// }

module.exports = async function (deployer) {
  //デプロイした後const ○○でコントラクトのインスタンスを取得
  await deployer.deploy(ERC20, "Dai", "DAI", web3.utils.toBN(10 ** 10));
  const dai = await ERC20.deployed();
  await deployer.deploy(ERC20, "Chainlink", "LINK", web3.utils.toBN(10 ** 6));
  const link = await ERC20.deployed();
  await deployer.deploy(ERC20, "Compound", "COMP", web3.utils.toBN(10 ** 4));
  const comp = await ERC20.deployed();

  //Dexのコントラクトをデプロイ→contract Dexのところを参照。引数はトークンアドレス
  //アドレスを取得・・・配列のところ
  await deployer.deploy(Dex, [dai.address, link.address, comp.address]);
  const dex = await Dex.deployed();

  //インスタンスを定義すれば、ERC20.solのメソッドが使えるようになる
  //   function transfer(address _to, uint256 _value) external returns (bool){
  //      _transfer(msg.sender, _to, _value);
  //     return true;
  //  }
  //コントラクトをデプロイした人は（msg.sender）からdex.addressに数量を渡す
  await dai.transfer(dex.address, toWei(10 ** 10));
  await link.transfer(dex.address, toWei(10 ** 6));
  await comp.transfer(dex.address, toWei(10 ** 4));
};
