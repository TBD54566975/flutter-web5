class Web5Js {
  static String get myDid => 'return window.myDid;';

  static String createRecord() => '''
window.oneMbyte = new Array(1024 * 1024).join('a');
window.oneHundredMbyte = new Array(101).join(oneMbyte);
window.blob = new Blob([oneHundredMbyte], {type: "text/plain"});
const { record, status } = await window.web5.dwn.records.write({
  data: blob,
  message: {
    schema: "text/plain",
  },
});
delete window.oneMbyte;
delete window.oneHundredMbyte;
delete window.blob;
return JSON.stringify(record.id, status);
''';

  static String getRecords() => '''
const { records } = await window.web5.dwn.records.query({
  message: {
    filter: {
      schema: "text/plain",
    },
  },
});
return JSON.stringify(records.length);
''';

  static String get createDid => '''
const didState = await window.Web5.Web5.did.create('ion')
return JSON.stringify(didState);
''';
}
