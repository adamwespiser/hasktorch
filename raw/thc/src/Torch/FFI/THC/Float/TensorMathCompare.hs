{-# LANGUAGE ForeignFunctionInterface #-}
module Torch.FFI.THC.Float.TensorMathCompare where

import Foreign
import Foreign.C.Types
import Data.Word
import Data.Int
import Torch.Types.TH
import Torch.Types.THC

-- | c_ltValue :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_ltValue"
  c_ltValue :: Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_gtValue :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_gtValue"
  c_gtValue :: Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_leValue :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_leValue"
  c_leValue :: Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_geValue :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_geValue"
  c_geValue :: Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_eqValue :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_eqValue"
  c_eqValue :: Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_neValue :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_neValue"
  c_neValue :: Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_ltValueT :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_ltValueT"
  c_ltValueT :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_gtValueT :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_gtValueT"
  c_gtValueT :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_leValueT :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_leValueT"
  c_leValueT :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_geValueT :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_geValueT"
  c_geValueT :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_eqValueT :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_eqValueT"
  c_eqValueT :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | c_neValueT :  state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h THCudaFloatTensor_neValueT"
  c_neValueT :: Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ()

-- | p_ltValue : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_ltValue"
  p_ltValue :: FunPtr (Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_gtValue : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_gtValue"
  p_gtValue :: FunPtr (Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_leValue : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_leValue"
  p_leValue :: FunPtr (Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_geValue : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_geValue"
  p_geValue :: FunPtr (Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_eqValue : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_eqValue"
  p_eqValue :: FunPtr (Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_neValue : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_neValue"
  p_neValue :: FunPtr (Ptr C'THCState -> Ptr C'THCudaByteTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_ltValueT : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_ltValueT"
  p_ltValueT :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_gtValueT : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_gtValueT"
  p_gtValueT :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_leValueT : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_leValueT"
  p_leValueT :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_geValueT : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_geValueT"
  p_geValueT :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_eqValueT : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_eqValueT"
  p_eqValueT :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())

-- | p_neValueT : Pointer to function : state self_ src value -> void
foreign import ccall "THCTensorMathCompare.h &THCudaFloatTensor_neValueT"
  p_neValueT :: FunPtr (Ptr C'THCState -> Ptr C'THCudaFloatTensor -> Ptr C'THCudaFloatTensor -> CFloat -> IO ())