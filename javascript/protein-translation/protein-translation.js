//
// This is only a SKELETON file for the 'Protein Translation' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const translate = (rna) => {
  if (!rna) { return [];}

  const translate_hash = {
    "AUG": 'Methionine',
    'UGG':'Tryptophan',
    'UUU': 'Phenylalanine',
    'UUC': 'Phenylalanine',
    'UUA':'Leucine',
    'UUG': 'Leucine',
    'UCU': 'Serine',
    'UCC': 'Serine',
    'UCA': 'Serine',
    'UCG': 'Serine',
    'UAU': 'Tyrosine',
    'UAC': 'Tyrosine',
    'UGU': 'Cysteine',
    'UGC': 'Cysteine',
    'UAA': 'STOP',
    'UAG': 'STOP',
    'UGA': 'STOP'
     };

  if (rna) {
    let arrayOfResults = [];
    var pattern = new RegExp(/(.{1,3})/g);
    var newText = rna.matchAll(pattern);
    for (let match of newText) {
      var protein = translate_hash[match[0]];

      if (!protein) {
        throw new Error('Invalid codon');
      }

      if (translate_hash[match[0]] === 'STOP') { break; }
      arrayOfResults.push(translate_hash[match[0]]);
    }
    return arrayOfResults;
  }
};

