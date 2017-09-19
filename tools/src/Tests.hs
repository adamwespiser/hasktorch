{-# LANGUAGE ForeignFunctionInterface #-}

module Main where

import Debug.Trace

import THFloatTensor as TR
import THFloatTensorMath as TR

import THDoubleTensor as TR
import THDoubleTensorMath as TR

import Foreign.C.Types

import Test.Hspec

testsFloat :: IO ()
testsFloat = do
  hspec $ do
    describe "Float Tensor creation and access methods" $ do
      it "initializes empty tensor with 0 dimension" $ do
        t <- c_THFloatTensor_new
        TR.c_THFloatTensor_nDimension t `shouldBe` 0
        c_THFloatTensor_free t
      it "1D tensor has correct dimensions and sizes" $ do
        t <- TR.c_THFloatTensor_newWithSize1d 10
        TR.c_THFloatTensor_nDimension t `shouldBe` 1
        TR.c_THFloatTensor_size t 0 `shouldBe` 10
        c_THFloatTensor_free t
      it "2D tensor has correct dimensions and sizes" $ do
        t <- c_THFloatTensor_newWithSize2d 10 25
        TR.c_THFloatTensor_nDimension t `shouldBe` 2
        TR.c_THFloatTensor_size t 0 `shouldBe` 10
        TR.c_THFloatTensor_size t 1 `shouldBe` 25
        c_THFloatTensor_free t
      it "3D tensor has correct dimensions and sizes" $ do
        t <- c_THFloatTensor_newWithSize3d 10 25 5
        TR.c_THFloatTensor_nDimension t `shouldBe` 3
        TR.c_THFloatTensor_size t 0 `shouldBe` 10
        TR.c_THFloatTensor_size t 1 `shouldBe` 25
        TR.c_THFloatTensor_size t 2 `shouldBe` 5
        c_THFloatTensor_free t
      it "4D tensor has correct dimensions and sizes" $ do
        t <- c_THFloatTensor_newWithSize4d 10 25 5 62
        TR.c_THFloatTensor_nDimension t `shouldBe` 4
        TR.c_THFloatTensor_size t 0 `shouldBe` 10
        TR.c_THFloatTensor_size t 1 `shouldBe` 25
        TR.c_THFloatTensor_size t 2 `shouldBe` 5
        TR.c_THFloatTensor_size t 3 `shouldBe` 62
        c_THFloatTensor_free t
      it "Can assign and retrieve correct 1D vector values" $ do
        t <- TR.c_THFloatTensor_newWithSize1d 10
        c_THFloatTensor_set1d t 0 (CFloat 20.5)
        c_THFloatTensor_set1d t 1 (CFloat 1.4)
        c_THFloatTensor_set1d t 9 (CFloat 3.14)
        c_THFloatTensor_get1d t 0 `shouldBe` (20.5 :: CFloat)
        c_THFloatTensor_get1d t 1 `shouldBe` (1.4 :: CFloat)
        c_THFloatTensor_get1d t 9 `shouldBe` (3.14 :: CFloat)
        c_THFloatTensor_free t
      it "Can assign and retrieve correct 2D vector values" $ do
        t <- TR.c_THFloatTensor_newWithSize2d 10 15
        c_THFloatTensor_set2d t 0 0 (CFloat 20.5)
        c_THFloatTensor_set2d t 1 5 (CFloat 1.4)
        c_THFloatTensor_set2d t 9 9 (CFloat 3.14)
        c_THFloatTensor_get2d t 0 0 `shouldBe` (20.5 :: CFloat)
        c_THFloatTensor_get2d t 1 5 `shouldBe` (1.4 :: CFloat)
        c_THFloatTensor_get2d t 9 9 `shouldBe` (3.14 :: CFloat)
        c_THFloatTensor_free t
      it "Can assign and retrieve correct 3D vector values" $ do
        t <- TR.c_THFloatTensor_newWithSize3d 10 15 10
        c_THFloatTensor_set3d t 0 0 0 (CFloat 20.5)
        c_THFloatTensor_set3d t 1 5 3 (CFloat 1.4)
        c_THFloatTensor_set3d t 9 9 9 (CFloat 3.14)
        c_THFloatTensor_get3d t 0 0 0 `shouldBe` (20.5 :: CFloat)
        c_THFloatTensor_get3d t 1 5 3 `shouldBe` (1.4 :: CFloat)
        c_THFloatTensor_get3d t 9 9 9 `shouldBe` (3.14 :: CFloat)
        c_THFloatTensor_free t
      it "Can assign and retrieve correct 4D vector values" $ do
        t <- TR.c_THFloatTensor_newWithSize4d 10 15 10 20
        c_THFloatTensor_set4d t 0 0 0 0 (CFloat 20.5)
        c_THFloatTensor_set4d t 1 5 3 2 (CFloat 1.4)
        c_THFloatTensor_set4d t 9 9 9 9 (CFloat 3.14)
        c_THFloatTensor_get4d t 0 0 0 0 `shouldBe` (20.5 :: CFloat)
        c_THFloatTensor_get4d t 1 5 3 2 `shouldBe` (1.4 :: CFloat)
        c_THFloatTensor_get4d t 9 9 9 9 `shouldBe` (3.14 :: CFloat)
        c_THFloatTensor_free t
      it "Can can initialize values with the fill method" $ do
        t1 <- c_THFloatTensor_newWithSize2d 2 2
        c_THFloatTensor_fill t1 3.1
        c_THFloatTensor_get2d t1 0 0 `shouldBe` (3.1 :: CFloat)
        c_THFloatTensor_free t1
      it "Can compute correct dot product between 1D vectors" $ do
        t1 <- c_THFloatTensor_newWithSize1d 3
        t2 <- c_THFloatTensor_newWithSize1d 3
        c_THFloatTensor_fill t1 3.0
        c_THFloatTensor_fill t2 4.0
        let value = c_THFloatTensor_dot t1 t2
        value `shouldBe` (36.0)
        c_THFloatTensor_free t1
        c_THFloatTensor_free t2
      it "Can compute correct dot product between 2D tensors" $ do
        t1 <- c_THFloatTensor_newWithSize2d 2 2
        t2 <- c_THFloatTensor_newWithSize2d 2 2
        c_THFloatTensor_fill t1 3.0
        c_THFloatTensor_fill t2 4.0
        let value = c_THFloatTensor_dot t1 t2
        value `shouldBe` (48.0)
        c_THFloatTensor_free t1
        c_THFloatTensor_free t2
      it "Can compute correct dot product between 3D tensors" $ do
        t1 <- c_THFloatTensor_newWithSize3d 2 2 4
        t2 <- c_THFloatTensor_newWithSize3d 2 2 4
        c_THFloatTensor_fill t1 3.0
        c_THFloatTensor_fill t2 4.0
        let value = c_THFloatTensor_dot t1 t2
        value `shouldBe` (192.0)
        c_THFloatTensor_free t1
        c_THFloatTensor_free t2
      it "Can compute correct dot product between 4D tensors" $ do
        t1 <- c_THFloatTensor_newWithSize4d 2 2 4 3
        t2 <- c_THFloatTensor_newWithSize4d 2 2 4 3
        c_THFloatTensor_fill t1 3.0
        c_THFloatTensor_fill t2 4.0
        let value = c_THFloatTensor_dot t1 t2
        value `shouldBe` (576.0)
        c_THFloatTensor_free t1
        c_THFloatTensor_free t2
      it "Can zero out values" $ do
        t1 <- c_THFloatTensor_newWithSize4d 2 2 4 3
        c_THFloatTensor_fill t1 3.0
        let value = c_THFloatTensor_dot t1 t1
        value `shouldBe` (432.0)
        c_THFloatTensor_zero t1
        let value = c_THFloatTensor_dot t1 t1
        value `shouldBe` (0.0)
        c_THFloatTensor_free t1
      it "Can compute sum of all values" $ do
        t1 <- c_THFloatTensor_newWithSize3d 2 2 4
        c_THFloatTensor_fill t1 2.5
        c_THFloatTensor_sumall t1 `shouldBe` 40.0
        c_THFloatTensor_free t1
      it "Can compute product of all values" $ do
        t1 <- c_THFloatTensor_newWithSize2d 2 2
        c_THFloatTensor_fill t1 1.5
        c_THFloatTensor_prodall t1 `shouldBe` 5.0625
        c_THFloatTensor_free t1
      it "Can take abs of tensor values" $ do
        t1 <- c_THFloatTensor_newWithSize2d 2 2
        c_THFloatTensor_fill t1 (-1.5)
        c_THFloatTensor_sumall t1 `shouldBe` (-6.0)
        c_THFloatTensor_abs t1 t1
        c_THFloatTensor_sumall t1 `shouldBe` (6.0)
        c_THFloatTensor_free t1

testsDouble :: IO ()
testsDouble = do
  hspec $ do
    describe "Double Tensor creation and access methods" $ do
      it "initializes empty tensor with 0 dimension" $ do
        t <- c_THDoubleTensor_new
        TR.c_THDoubleTensor_nDimension t `shouldBe` 0
        c_THDoubleTensor_free t
      it "1D tensor has correct dimensions and sizes" $ do
        t <- TR.c_THDoubleTensor_newWithSize1d 10
        TR.c_THDoubleTensor_nDimension t `shouldBe` 1
        TR.c_THDoubleTensor_size t 0 `shouldBe` 10
        c_THDoubleTensor_free t
      it "2D tensor has correct dimensions and sizes" $ do
        t <- c_THDoubleTensor_newWithSize2d 10 25
        TR.c_THDoubleTensor_nDimension t `shouldBe` 2
        TR.c_THDoubleTensor_size t 0 `shouldBe` 10
        TR.c_THDoubleTensor_size t 1 `shouldBe` 25
        c_THDoubleTensor_free t
      it "3D tensor has correct dimensions and sizes" $ do
        t <- c_THDoubleTensor_newWithSize3d 10 25 5
        TR.c_THDoubleTensor_nDimension t `shouldBe` 3
        TR.c_THDoubleTensor_size t 0 `shouldBe` 10
        TR.c_THDoubleTensor_size t 1 `shouldBe` 25
        TR.c_THDoubleTensor_size t 2 `shouldBe` 5
        c_THDoubleTensor_free t
      it "4D tensor has correct dimensions and sizes" $ do
        t <- c_THDoubleTensor_newWithSize4d 10 25 5 62
        TR.c_THDoubleTensor_nDimension t `shouldBe` 4
        TR.c_THDoubleTensor_size t 0 `shouldBe` 10
        TR.c_THDoubleTensor_size t 1 `shouldBe` 25
        TR.c_THDoubleTensor_size t 2 `shouldBe` 5
        TR.c_THDoubleTensor_size t 3 `shouldBe` 62
        c_THDoubleTensor_free t
      it "Can assign and retrieve correct 1D vector values" $ do
        t <- TR.c_THDoubleTensor_newWithSize1d 10
        c_THDoubleTensor_set1d t 0 (CDouble 20.5)
        c_THDoubleTensor_set1d t 1 (CDouble 1.4)
        c_THDoubleTensor_set1d t 9 (CDouble 3.14)
        c_THDoubleTensor_get1d t 0 `shouldBe` (20.5 :: CDouble)
        c_THDoubleTensor_get1d t 1 `shouldBe` (1.4 :: CDouble)
        c_THDoubleTensor_get1d t 9 `shouldBe` (3.14 :: CDouble)
        c_THDoubleTensor_free t
      it "Can assign and retrieve correct 2D vector values" $ do
        t <- TR.c_THDoubleTensor_newWithSize2d 10 15
        c_THDoubleTensor_set2d t 0 0 (CDouble 20.5)
        c_THDoubleTensor_set2d t 1 5 (CDouble 1.4)
        c_THDoubleTensor_set2d t 9 9 (CDouble 3.14)
        c_THDoubleTensor_get2d t 0 0 `shouldBe` (20.5 :: CDouble)
        c_THDoubleTensor_get2d t 1 5 `shouldBe` (1.4 :: CDouble)
        c_THDoubleTensor_get2d t 9 9 `shouldBe` (3.14 :: CDouble)
        c_THDoubleTensor_free t
      it "Can assign and retrieve correct 3D vector values" $ do
        t <- TR.c_THDoubleTensor_newWithSize3d 10 15 10
        c_THDoubleTensor_set3d t 0 0 0 (CDouble 20.5)
        c_THDoubleTensor_set3d t 1 5 3 (CDouble 1.4)
        c_THDoubleTensor_set3d t 9 9 9 (CDouble 3.14)
        c_THDoubleTensor_get3d t 0 0 0 `shouldBe` (20.5 :: CDouble)
        c_THDoubleTensor_get3d t 1 5 3 `shouldBe` (1.4 :: CDouble)
        c_THDoubleTensor_get3d t 9 9 9 `shouldBe` (3.14 :: CDouble)
        c_THDoubleTensor_free t
      it "Can assign and retrieve correct 4D vector values" $ do
        t <- TR.c_THDoubleTensor_newWithSize4d 10 15 10 20
        c_THDoubleTensor_set4d t 0 0 0 0 (CDouble 20.5)
        c_THDoubleTensor_set4d t 1 5 3 2 (CDouble 1.4)
        c_THDoubleTensor_set4d t 9 9 9 9 (CDouble 3.14)
        c_THDoubleTensor_get4d t 0 0 0 0 `shouldBe` (20.5 :: CDouble)
        c_THDoubleTensor_get4d t 1 5 3 2 `shouldBe` (1.4 :: CDouble)
        c_THDoubleTensor_get4d t 9 9 9 9 `shouldBe` (3.14 :: CDouble)
        c_THDoubleTensor_free t
      it "Can can initialize values with the fill method" $ do
        t1 <- c_THDoubleTensor_newWithSize2d 2 2
        c_THDoubleTensor_fill t1 3.1
        c_THDoubleTensor_get2d t1 0 0 `shouldBe` (3.1 :: CDouble)
        c_THDoubleTensor_free t1
      it "Can compute correct dot product between 1D vectors" $ do
        t1 <- c_THDoubleTensor_newWithSize1d 3
        t2 <- c_THDoubleTensor_newWithSize1d 3
        c_THDoubleTensor_fill t1 3.0
        c_THDoubleTensor_fill t2 4.0
        let value = c_THDoubleTensor_dot t1 t2
        value `shouldBe` (36.0 :: CDouble)
        c_THDoubleTensor_free t1
        c_THDoubleTensor_free t2
      it "Can compute correct dot product between 2D tensors" $ do
        t1 <- c_THDoubleTensor_newWithSize2d 2 2
        t2 <- c_THDoubleTensor_newWithSize2d 2 2
        c_THDoubleTensor_fill t1 3.0
        c_THDoubleTensor_fill t2 4.0
        let value = c_THDoubleTensor_dot t1 t2
        value `shouldBe` (48.0 :: CDouble)
        c_THDoubleTensor_free t1
        c_THDoubleTensor_free t2
      it "Can compute correct dot product between 3D tensors" $ do
        t1 <- c_THDoubleTensor_newWithSize3d 2 2 4
        t2 <- c_THDoubleTensor_newWithSize3d 2 2 4
        c_THDoubleTensor_fill t1 3.0
        c_THDoubleTensor_fill t2 4.0
        let value = c_THDoubleTensor_dot t1 t2
        value `shouldBe` (192.0 :: CDouble)
        c_THDoubleTensor_free t1
        c_THDoubleTensor_free t2
      it "Can compute correct dot product between 4D tensors" $ do
        t1 <- c_THDoubleTensor_newWithSize4d 2 2 4 3
        t2 <- c_THDoubleTensor_newWithSize4d 2 2 4 3
        c_THDoubleTensor_fill t1 3.0
        c_THDoubleTensor_fill t2 4.0
        let value = c_THDoubleTensor_dot t1 t2
        value `shouldBe` (576.0 :: CDouble)
        c_THDoubleTensor_free t1
        c_THDoubleTensor_free t2
      it "Can zero out values" $ do
        t1 <- c_THDoubleTensor_newWithSize4d 2 2 4 3
        c_THDoubleTensor_fill t1 3.0
        let value = c_THDoubleTensor_dot t1 t1
        value `shouldBe` (432.0 :: CDouble)
        c_THDoubleTensor_zero t1
        let value = c_THDoubleTensor_dot t1 t1
        -- TODO this fails
        print value
        value `shouldBe` (0.0 :: CDouble)
        c_THDoubleTensor_free t1
      it "Can compute sum of all values" $ do
        t1 <- c_THDoubleTensor_newWithSize3d 2 2 4
        c_THDoubleTensor_fill t1 2.5
        c_THDoubleTensor_sumall t1 `shouldBe` 40.0
        c_THDoubleTensor_free t1
      it "Can compute product of all values" $ do
        t1 <- c_THDoubleTensor_newWithSize2d 2 2
        c_THDoubleTensor_fill t1 1.5
        c_THDoubleTensor_prodall t1 `shouldBe` 5.0625
        c_THDoubleTensor_free t1
      it "Can take abs of tensor values" $ do
        t1 <- c_THDoubleTensor_newWithSize2d 2 2
        c_THDoubleTensor_fill t1 (-1.5)
        c_THDoubleTensor_sumall t1 `shouldBe` (-6.0)
        c_THDoubleTensor_abs t1 t1
        c_THDoubleTensor_sumall t1 `shouldBe` (6.0)
        c_THDoubleTensor_free t1

main :: IO ()
main = do
  testsFloat
  testsDouble
  bug1
  bug2
  putStrLn "Done"

bug1 = do
  t1 <- c_THFloatTensor_newWithSize4d 2 2 4 3
  c_THFloatTensor_fill t1 3.0
  t2 <- c_THFloatTensor_newWithSize4d 2 2 4 3
  c_THFloatTensor_fill t2 3.0

  let value = c_THFloatTensor_dot t1 t1
  print "should be 432"
  print value

  let value = c_THFloatTensor_dot t1 t2
  print "should be 432"
  print value

  c_THFloatTensor_zero t1

  let value = c_THFloatTensor_dot t1 t1
  print "should be 0"
  print value
  c_THFloatTensor_free t1

bug2 = do
  t1 <- c_THFloatTensor_newWithSize2d 2 2
  c_THFloatTensor_fill t1 (-1.5)
  print "should be -6.0"
  print $ c_THFloatTensor_sumall t1

  t2 <- c_THFloatTensor_newWithSize2d 2 2
  c_THFloatTensor_abs t2 t1
  print "should be 6.0"
  print $ c_THFloatTensor_sumall t2

  c_THFloatTensor_abs t1 t1
  print "should be 6.0"
  print $ c_THFloatTensor_sumall t1

  c_THFloatTensor_free t1
  c_THFloatTensor_free t2