use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(phrase: &str) -> HashMap<String, u32> {
  let mut map = HashMap::new();
  for word in phrase.split_whitespace(){
      let count = map.entry(String::from(word.to_lowercase())).or_insert(0);
      *count += 1;
  }
  map
}

// TODO: pensalo de otra forma, para evitar usar el for. Quiza con un punto iter, y una funcion lambda, podria funcionar.
