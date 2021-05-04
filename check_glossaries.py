import re
from pathlib import Path


glossaries_file = "glossaries.tex"

# \newglossaryentry{openssl}{name=OpenSSL, description={A freely available cryptographic library}, text=AES}
glossary_regex = re.compile(r"\\newglossaryentry\{([^}]+)\}\{name=\{?([^},]+)\}?, description=\{?([^},]+)\}?(, text=\{?([^},]+)\}?)?")
# \newacronym{fft}{FFT}{Fast Fourier Transform}
acronym_regex = re.compile(r"\\newacronym\{([^}]+)\}\{([^}]+)\}\{([^}]+)\}")

def main():
  glossaries = []
  acronyms = []
  with open(glossaries_file, "r") as file:
    contents = file.read()
    matches = glossary_regex.findall(contents)
    for command, name, description, _, text in matches:
      glossaries.append((command, name, description, text))

    matches = acronym_regex.findall(contents)
    for command, name, description in matches:
      acronyms.append((command, name, description))

  #print(glossaries)
  #print(acronyms)

  for path in Path("./").glob("**/*.tex"):
    if path.name == glossaries_file:
      continue

    with open(path, "r") as file:
      for i, line in enumerate(file.readlines()):
        for command, name, description, text in glossaries:
          expression = name if text == "" else text
          expression = r"(.{{0,10}})({})(.{{0,10}})".format(expression)
          #print(expression)
          # matches = re.findall(expression, line, re.IGNORECASE)
          matches = re.findall(expression, line)
          for before, match, after in matches:
            if not before.endswith("\\gls{") and not before.endswith("\\glspl{") and not "".startswith("%"):
              print("\x1b[32m{}@{}\x1b[0m: {}\x1b[31m{}\x1b[0m{}".format(path, i + 1, before, match, after))
        for command, name, description in acronyms:
          expression = name
          expression = r"(.{{0,10}})({})(.{{0,10}})".format(expression)
          #print(expression)
          # matches = re.findall(expression, line, re.IGNORECASE)
          matches = re.findall(expression, line)
          for before, match, after in matches:
            if not before.endswith("\\gls{") and not before.endswith("\\glspl{") and not "".startswith("%"):
              print("\x1b[32m{}@{}\x1b[0m: {}\x1b[31m{}\x1b[0m{}".format(path, i + 1, before, match, after))



if __name__ == "__main__":
    main()