import Typedefs
import Parse
import Backend
import Backend.Utils
import Backend.Haskell

main : IO ()
main = do
  [_, str] <- getArgs
  let tpm = parseTNamed str
  putStrLn $ "parsed typedef: "
  putStrLn $ maybe ("Failed to parse '" ++ str ++ "'.") (\tp => show $ DPair.snd tp) tpm
  putStrLn $ ""
  putStrLn $ "haskell type: " ++ maybe ("Failed to parse '" ++ str ++ "'.") (\tp => print . generateDefs Haskell $ DPair.snd tp) tpm