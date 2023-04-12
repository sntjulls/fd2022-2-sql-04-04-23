const { Client } = require("pg");
const config = {
  host: "localhost",
  port: 5432,
  database: "fd_test",
  user: "postgres",
  password: "postgres",
};

const loadUsers = async () => {
  const res = await fetch(
    "https://randomuser.me/api/?results=100&seed=fdpg&nat=gb&page=6"
  );
  const data = await res.json();
  return data.results;
};

// const users = [
//   {
//     firstName: "Brad",
//     lastName: "Pitt",
//     email: "pitt741@gmail.com",
//     isMale: true,
//     birthday: "1963-12-18",
//     height: 1.87,
//   },
//   {
//     firstName: "Alex",
//     lastName: "Trump",
//     email: "alex@gmail.com",
//     isMale: false,
//     birthday: "1993-12-18",
//     height: 1.57,
//   },
//   {
//     firstName: "Mary",
//     lastName: "Poppins",
//     email: "mary@gmail.com",
//     isMale: false,
//     birthday: "2003-12-18",
//     height: 1.67,
//   },
// ];

const mapUsers = (users) => {
  return users
    .map(
      ({ name: { first, last }, email, gender, dob: { date } }) =>
        `('${first}', '${last}', '${email}', '${
          gender === "male"
        }', '${date}', '${(Math.random() + 1.2).toFixed(2)}')`
    )
    .join(",");
};
// console.log(mapUsers(users));

const client = new Client(config);
start();

async function start() {
  await client.connect();
  const users = await loadUsers();
  const res = await client.query(`
INSERT INTO "users"("firstName", "lastName", "email", "isMale", "birthday", "height")
VALUES ${mapUsers(users)};
`);
  console.log(res);
  await client.end();
}
