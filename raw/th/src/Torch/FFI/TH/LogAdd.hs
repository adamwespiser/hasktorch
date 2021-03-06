{-# LANGUAGE ForeignFunctionInterface #-}
module Torch.FFI.TH.LogAdd where

import Foreign
import Foreign.C.Types
import Data.Word
import Data.Int
import Torch.Types.TH

-- | c_THLogAdd :  log_a log_b -> double
foreign import ccall "THLogAdd.h THLogAdd"
  c_THLogAdd :: CDouble -> CDouble -> IO CDouble

-- | c_THLogSub :  log_a log_b -> double
foreign import ccall "THLogAdd.h THLogSub"
  c_THLogSub :: CDouble -> CDouble -> IO CDouble

-- | c_THExpMinusApprox :  x -> double
foreign import ccall "THLogAdd.h THExpMinusApprox"
  c_THExpMinusApprox :: CDouble -> IO CDouble

-- | p_THLogAdd : Pointer to function : log_a log_b -> double
foreign import ccall "THLogAdd.h &THLogAdd"
  p_THLogAdd :: FunPtr (CDouble -> CDouble -> IO CDouble)

-- | p_THLogSub : Pointer to function : log_a log_b -> double
foreign import ccall "THLogAdd.h &THLogSub"
  p_THLogSub :: FunPtr (CDouble -> CDouble -> IO CDouble)

-- | p_THExpMinusApprox : Pointer to function : x -> double
foreign import ccall "THLogAdd.h &THExpMinusApprox"
  p_THExpMinusApprox :: FunPtr (CDouble -> IO CDouble)