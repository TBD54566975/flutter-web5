import { Web5 } from "https://cdn.jsdelivr.net/npm/@tbd54566975/web5@0.7.5/dist/browser.mjs";

const { web5, did: myDid } = await Web5.connect();
const copyDidElement = document.querySelector("#copy-did");

console.log(myDid);

copyDidElement.addEventListener("click", async () => {
  try {
    console.log(myDid);
    // await navigator.clipboard.writeText(myDid);
  } catch (err) {
    console.log("Failed to copy DID: ", err);
    alert("Failed to copy DID: ", err);
  }
});

function getDid() {
  SnackBar.postMessage(myDid);
  return myDid;
}

function createRecord() {
  SnackBar.postMessage("Creating record...");
}

async function getRecords() {
  const { records } = await web5.dwn.records.query({
    message: {
      filter: {
        schema: "https://schema.org/Playlist",
        dataFormat: "application/json",
      },
    },
  });

  SnackBar.postMessage(records);
}
