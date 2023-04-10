async function f1() {
  return 7;
}

function f2() {
  return Promise.resolve(8);
}

// const test1 = f1();

// f1().then((data) => console.log(data));
// f2().then((data) => console.log(data));

const f3 = async () => {
  try {
    const res = await fetch();
    const data = await res.json();
  } catch (error) {
    console.log(error);
  }
};

fetch()
  .then((res) => res.json())
  .then((data) => data)
  .catch((err) => err);

// await fetch(); Error!
