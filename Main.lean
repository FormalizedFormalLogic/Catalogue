import Catalogue

open Verso.Genre.Manual

def juliamonoFonts := (include_bin_dir "./assets/juliamono") |>.map λ (name, contents) => (name.dropPrefix "./assets/", contents)

def main := manualMain (%doc Catalogue) (config := config)
where
  config := {
    htmlDepth := 2,
    sourceLink := some "https://github.com/FormalizedFormalLogic/Catalogue",
    issueLink := some "https://github.com/FormalizedFormalLogic/Catalogue/issues",
    extraFiles := [("assets", "assets")],
    logo := some "/assets/logo.svg",
    extraCssFiles := Std.HashSet.ofList [
      { filename := "style.css", contents := (include_str "./assets/style.css") }
    ]
  }
