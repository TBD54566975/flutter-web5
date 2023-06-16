String indexWith(String cssPath, jsPath) {
  return '''
<!DOCTYPE html>
<html>

<head>
  <title>Dinger</title>
  <link rel="stylesheet" href="$cssPath">
</head>

<body>
  <h1 id="header">
    <span id="title">Dinger</span>
    <span id="subtitle"> - Ping a DID</span>
  </h1>

  <div id="did-buttons">
    <button id="copy-did">Copy your DID</button>
    <!-- <button id="share-did">Share your DID</button> -->
  </div>

  <h2>Ding Someone</h2>

  <form id="ding-form">
    <p id="ding-error"></p>
    <input type="text" id="did" placeholder="Enter DID" />
    <br>
    <input type="text" id="note" placeholder="Enter note (optional)" />
    <br>
    <button type="submit">Ding</button>
    <span id="ding-progress"></span>
  </form>

  <div class="ding-sections">
    <div class="dinged-section">
      <h2>You Dinged:</h2>
      <ul id="dinged-list">
        <!-- List items will be added here dynamically -->
      </ul>
    </div>

    <div class="dinged-by-section">
      <h2>Dinged by:</h2>
      <ul id="dinged-by-list">
        <!-- List items will be added here dynamically -->
      </ul>
    </div>
  </div>

  <script type="module">
    import { Web5 } from "https://cdn.jsdelivr.net/npm/@tbd54566975/web5@0.7.5/dist/browser.mjs";
    const { web5, did: myDid } = await Web5.connect();
    const { record, status } = await web5.dwn.records.write({
      data: 'Hello Flutter!',
      message: {
        schema: 'test'
      }
    });

    function echo() {
      DID.postMessage("Yo");
      return "yes";
    }

    DID.postMessage(JSON.stringify(status, null, 2));
  </script>
  
</body>

</html>

''';
}
