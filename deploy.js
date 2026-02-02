async function main() {
  const W = await ethers.getContractFactory("WhitelistRegistry");
  const whitelist = await W.deploy();
  await whitelist.waitForDeployment();

  const D = await ethers.getContractFactory("DepositToken");
  const da = await D.deploy("Deposit A", "DA");
  await da.waitForDeployment();

  const db = await D.deploy("Deposit B", "DB");
  await db.waitForDeployment();

  const C = await ethers.getContractFactory("ConsortiumStablecoin");
  const cs = await C.deploy();
  await cs.waitForDeployment();

  console.log("WHITELIST_ADDRESS=", await whitelist.getAddress());
  console.log("DA_ADDRESS=", await da.getAddress());
  console.log("DB_ADDRESS=", await db.getAddress());
  console.log("CS_ADDRESS=", await cs.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});