-- file test/SolutionSpec.hs
module Solution.Spec where

import Solution
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

spec :: Spec
spec = do
  describe "Solution.listToNumber" $ do
    it "returns the element" $ do
      listToNumber [1, 2, 3] `shouldBe` 123

    it "returns zero if list only contains zeroes" $ do
      listToNumber [0, 0, 0, 0, 0] `shouldBe` 0

    it "returns rest of the number if first is zero" $ do
      listToNumber [0, 8, 4, 3, 2] `shouldBe` 8432

  describe "Solution.suffix" $ do
    it "returns True when a list is a suffix of another list" $ do
      suffix [1, 2, 3] [4, 5, 6, 1, 2, 3] `shouldBe` True
      suffix [1..10] [1..10] `shouldBe` True

    it "returns False when a list isn't a suffox of another list" $ do
      suffix [1, 2, 3] [4, 5, 6, 1, 2] `shouldBe` False
      suffix [1..10] [1..11] `shouldBe` False

  describe "Solution.occurrences" $ do
    it "returns empty list if no elements" $ do
      occurrences [] [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] `shouldBe` []

    it "returns list of zeroes if second list is empty" $ do
      occurrences [2, 3, 4] [] `shouldBe` [0, 0, 0]

    it "maps the times an element is seen in a list" $ do
      occurrences [2, 2, 2] [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2] `shouldBe` [12, 12, 12]

  describe "Solution.removeAt" $ do
    it "removes elements at index" $ do
      removeAt 0 [1,2,3] `shouldBe` [2,3]
      removeAt 1 [1,2,3] `shouldBe` [1,3]
      removeAt 3 [5,6,7,9] `shouldBe` [5,6,7]

    it "raises Index out of bounds" $ do
      evaluate(removeAt (-1) [1,2,3]) `shouldThrow` errorCall "Index out of bounds"
      evaluate(removeAt 100 [1,2,3]) `shouldThrow` errorCall "Index out of bounds"


main :: IO ()
main = hspec spec

