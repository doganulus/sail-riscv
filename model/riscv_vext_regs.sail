/*=======================================================================================*/
/*  This Sail RISC-V architecture model, comprising all files and                        */
/*  directories except where otherwise noted is subject the BSD                          */
/*  two-clause license in the LICENSE file.                                              */
/*                                                                                       */
/*  SPDX-License-Identifier: BSD-2-Clause                                                */
/*=======================================================================================*/

newtype vregidx = Vregidx : bits(5)
newtype vregno = Vregno : range(0, 31)
function vregidx_to_vregno (Vregidx(b) : vregidx) -> vregno = Vregno(unsigned(b))
function vregno_to_vregidx (Vregno(b) : vregno) -> vregidx = Vregidx(to_bits(5, b))
function vregidx_offset(Vregidx(r) : vregidx, o : bits(5)) -> vregidx = Vregidx(r + o)
function vregidx_bits (Vregidx(b) : vregidx) -> bits(5) = b

mapping encdec_vreg : vregidx <-> bits(5) = { Vregidx(r) <-> r }

val vreg_write_callback = pure {c: "vreg_write_callback"} : (vregidx, vregtype) -> unit
function vreg_write_callback(_) = ()

let zvreg : vregidx = Vregidx(0b00000) /* v0, zero register  */

/* vector registers */
register vr0 : vregtype
register vr1 : vregtype
register vr2 : vregtype
register vr3 : vregtype
register vr4 : vregtype
register vr5 : vregtype
register vr6 : vregtype
register vr7 : vregtype
register vr8 : vregtype
register vr9 : vregtype
register vr10 : vregtype
register vr11 : vregtype
register vr12 : vregtype
register vr13 : vregtype
register vr14 : vregtype
register vr15 : vregtype
register vr16 : vregtype
register vr17 : vregtype
register vr18 : vregtype
register vr19 : vregtype
register vr20 : vregtype
register vr21 : vregtype
register vr22 : vregtype
register vr23 : vregtype
register vr24 : vregtype
register vr25 : vregtype
register vr26 : vregtype
register vr27 : vregtype
register vr28 : vregtype
register vr29 : vregtype
register vr30 : vregtype
register vr31 : vregtype

mapping vreg_name_raw : bits(5) <-> string = {
    0b00000 <-> "v0",
    0b00001 <-> "v1",
    0b00010 <-> "v2",
    0b00011 <-> "v3",
    0b00100 <-> "v4",
    0b00101 <-> "v5",
    0b00110 <-> "v6",
    0b00111 <-> "v7",
    0b01000 <-> "v8",
    0b01001 <-> "v9",
    0b01010 <-> "v10",
    0b01011 <-> "v11",
    0b01100 <-> "v12",
    0b01101 <-> "v13",
    0b01110 <-> "v14",
    0b01111 <-> "v15",
    0b10000 <-> "v16",
    0b10001 <-> "v17",
    0b10010 <-> "v18",
    0b10011 <-> "v19",
    0b10100 <-> "v20",
    0b10101 <-> "v21",
    0b10110 <-> "v22",
    0b10111 <-> "v23",
    0b11000 <-> "v24",
    0b11001 <-> "v25",
    0b11010 <-> "v26",
    0b11011 <-> "v27",
    0b11100 <-> "v28",
    0b11101 <-> "v29",
    0b11110 <-> "v30",
    0b11111 <-> "v31"
}

mapping vreg_name : vregidx <-> string = { Vregidx(i) <-> vreg_name_raw(i) }

function dirty_v_context() -> unit = {
  assert(hartSupports(Ext_V));
  mstatus[VS] = extStatus_to_bits(Dirty);
  mstatus[SD] = 0b1;
  long_csr_write_callback("mstatus", "mstatush", mstatus.bits);
}

function rV (Vregno(r) : vregno) -> vregtype = {
  match r {
    0 => vr0,
    1 => vr1,
    2 => vr2,
    3 => vr3,
    4 => vr4,
    5 => vr5,
    6 => vr6,
    7 => vr7,
    8 => vr8,
    9 => vr9,
    10 => vr10,
    11 => vr11,
    12 => vr12,
    13 => vr13,
    14 => vr14,
    15 => vr15,
    16 => vr16,
    17 => vr17,
    18 => vr18,
    19 => vr19,
    20 => vr20,
    21 => vr21,
    22 => vr22,
    23 => vr23,
    24 => vr24,
    25 => vr25,
    26 => vr26,
    27 => vr27,
    28 => vr28,
    29 => vr29,
    30 => vr30,
    31 => vr31,
  }
}

function wV (Vregno(r) : vregno, v : vregtype) -> unit = {
  match r {
    0 => vr0 = v,
    1 => vr1 = v,
    2 => vr2 = v,
    3 => vr3 = v,
    4 => vr4 = v,
    5 => vr5 = v,
    6 => vr6 = v,
    7 => vr7 = v,
    8 => vr8 = v,
    9 => vr9 = v,
    10 => vr10 = v,
    11 => vr11 = v,
    12 => vr12 = v,
    13 => vr13 = v,
    14 => vr14 = v,
    15 => vr15 = v,
    16 => vr16 = v,
    17 => vr17 = v,
    18 => vr18 = v,
    19 => vr19 = v,
    20 => vr20 = v,
    21 => vr21 = v,
    22 => vr22 = v,
    23 => vr23 = v,
    24 => vr24 = v,
    25 => vr25 = v,
    26 => vr26 = v,
    27 => vr27 = v,
    28 => vr28 = v,
    29 => vr29 = v,
    30 => vr30 = v,
    31 => vr31 = v,
  };

  dirty_v_context();

  assert(0 < VLEN & VLEN <= sizeof(vlenmax));
  vreg_write_callback(vregno_to_vregidx(Vregno(r)), v);
}

function rV_bits(i: vregidx) -> vregtype = rV(vregidx_to_vregno(i))

function wV_bits(i: vregidx, data: vregtype) -> unit = {
  wV(vregidx_to_vregno(i)) = data
}

overload V = {rV_bits, wV_bits, rV, wV}

val init_vregs : unit -> unit
function init_vregs () = {
  let zero_vreg : vregtype = zeros();
  vr0  = zero_vreg;
  vr1  = zero_vreg;
  vr2  = zero_vreg;
  vr3  = zero_vreg;
  vr4  = zero_vreg;
  vr5  = zero_vreg;
  vr6  = zero_vreg;
  vr7  = zero_vreg;
  vr8  = zero_vreg;
  vr9  = zero_vreg;
  vr10 = zero_vreg;
  vr11 = zero_vreg;
  vr12 = zero_vreg;
  vr13 = zero_vreg;
  vr14 = zero_vreg;
  vr15 = zero_vreg;
  vr16 = zero_vreg;
  vr17 = zero_vreg;
  vr18 = zero_vreg;
  vr19 = zero_vreg;
  vr20 = zero_vreg;
  vr21 = zero_vreg;
  vr22 = zero_vreg;
  vr23 = zero_vreg;
  vr24 = zero_vreg;
  vr25 = zero_vreg;
  vr26 = zero_vreg;
  vr27 = zero_vreg;
  vr28 = zero_vreg;
  vr29 = zero_vreg;
  vr30 = zero_vreg;
  vr31 = zero_vreg
}

/* Vector CSR */
bitfield Vcsr : bits(3) = {
  vxrm  : 2 .. 1,
  vxsat : 0
}
register vcsr : Vcsr

val ext_write_vcsr : (bits(2), bits(1)) -> unit
function ext_write_vcsr (vxrm_val, vxsat_val) = {
  vcsr[vxrm]  = vxrm_val; /* Note: frm can be an illegal value, 101, 110, 111 */
  vcsr[vxsat] = vxsat_val;
  dirty_v_context()
}

/* num_elem means max(VLMAX,VLEN/SEW)) according to Section 5.4 of RVV spec */
val get_num_elem : (int, sew_bitsize) -> nat1
function get_num_elem(LMUL_pow, SEW) = {
  let LMUL_pow_reg = if LMUL_pow < 0 then 0 else LMUL_pow;
  /* Ignore lmul < 1 so that the entire vreg is read, allowing all masking to
   * be handled in init_masked_result */
  let num_elem = (2 ^ LMUL_pow_reg) * VLEN / SEW;
  assert(num_elem > 0);
  num_elem
}

/* Reads a single vreg into multiple elements */
val read_single_vreg : forall 'n 'm, 'n >= 0 & is_sew_bitsize('m) . (int('n), int('m), vregidx) -> vector('n, bits('m))
function read_single_vreg(num_elem, SEW, vrid) = {
  let bv     : vregtype                  = V(vrid);
  var result : vector('n, bits('m)) = vector_init(zeros());

  foreach (i from 0 to (num_elem - 1)) {
    let start_index = i * SEW;
    result[i] = slice(bv, start_index, SEW);
  };

  result
}

/* Writes multiple elements into a single vreg */
val write_single_vreg : forall 'n 'm, 'n >= 0 & is_sew_bitsize('m) . (int('n), int('m), vregidx, vector('n, bits('m))) -> unit
function write_single_vreg(num_elem, SEW, vrid, v) = {
  var r : vregtype = zeros();

  foreach (i from (num_elem - 1) downto 0) {
    r = r << SEW;
    r = r | zero_extend(v[i]);
  };

  V(vrid) = r
}

/* The general vreg reading operation with num_elem as max(VLMAX,VLEN/SEW)) */
val read_vreg : forall 'n 'm 'p, 'n >= 0 & is_sew_bitsize('m) . (int('n), int('m), int('p), vregidx) -> vector('n, bits('m))
function read_vreg(num_elem, SEW, LMUL_pow, vrid) = {
  let vrid_val = unsigned(vregidx_bits(vrid));
  var result : vector('n, bits('m)) = vector_init(zeros());
  let LMUL_pow_reg = if LMUL_pow < 0 then 0 else LMUL_pow;

  /* Check for valid vrid */
  if vrid_val + 2 ^ LMUL_pow_reg > 32 then {
    /* vrid would read past largest vreg (v31) */
    assert(false, "invalid register group: vrid overflow the largest number")
  } else if vrid_val % (2 ^ LMUL_pow_reg) != 0 then {
    /* vrid must be a multiple of emul */
    assert(false, "invalid register group: vrid is not a multiple of EMUL")
  } else {
    if LMUL_pow < 0 then {
      result = read_single_vreg('n, SEW, vrid);
    } else {
      let 'num_elem_single = VLEN / SEW;
      assert('num_elem_single >= 0);
      foreach (i_lmul from 0 to (2 ^ LMUL_pow_reg - 1)) {
        let r_start_i : int = i_lmul * 'num_elem_single;
        let r_end_i   : int = r_start_i + 'num_elem_single - 1;
        let vrid_lmul     : vregidx = vregidx_offset(vrid, to_bits_unsafe(5, i_lmul));
        let single_result : vector('num_elem_single, bits('m)) = read_single_vreg('num_elem_single, SEW, vrid_lmul);
        foreach (r_i from r_start_i to r_end_i) {
          let s_i : int = r_i - r_start_i;
          assert(0 <= r_i & r_i < num_elem);
          assert(0 <= s_i & s_i < 'num_elem_single);
          result[r_i] = single_result[s_i];
        }
      }
    }
  };

  result
}

/* Single element reading operation */
val read_single_element : forall 'm, is_sew_bitsize('m) . (int('m), nat, vregidx) -> bits('m)
function read_single_element(EEW, index, vrid) = {
  assert(VLEN >= EEW);
  let 'elem_per_reg = VLEN / EEW;
  assert('elem_per_reg > 0);
  let real_vrid  : vregidx = vregidx_offset(vrid, to_bits_unsafe(5, index / 'elem_per_reg));
  let real_index : int    = index % 'elem_per_reg;
  let vrid_val : vector('elem_per_reg, bits('m)) = read_single_vreg('elem_per_reg, EEW, real_vrid);
  assert(0 <= real_index & real_index < 'elem_per_reg);
  vrid_val[real_index]
}

/* The general vreg writing operation with num_elem as max(VLMAX,VLEN/SEW)) */
val write_vreg : forall 'n 'm 'p, 'n >= 0 & is_sew_bitsize('m) . (int('n), int('m), int('p), vregidx, vector('n, bits('m))) -> unit
function write_vreg(num_elem, SEW, LMUL_pow, vrid, vec) = {
  let LMUL_pow_reg = if LMUL_pow < 0 then 0 else LMUL_pow;

  let 'num_elem_single  : int = VLEN / SEW;
  assert('num_elem_single >= 0);
  foreach (i_lmul from 0 to (2 ^ LMUL_pow_reg - 1)) {
    var single_vec : vector('num_elem_single, bits('m)) = vector_init(zeros());
    let vrid_lmul  : vregidx = vregidx_offset(vrid, to_bits_unsafe(5, i_lmul));
    let r_start_i  : int = i_lmul * 'num_elem_single;
    let r_end_i    : int = r_start_i + 'num_elem_single - 1;
    foreach (r_i from r_start_i to r_end_i) {
      let s_i : int = r_i - r_start_i;
      assert(0 <= r_i & r_i < num_elem);
      assert(0 <= s_i & s_i < 'num_elem_single);
      single_vec[s_i] = vec[r_i]
    };
    write_single_vreg('num_elem_single, SEW, vrid_lmul, single_vec)
  }
}

/* Single element writing operation */
val write_single_element : forall 'm, is_sew_bitsize('m) . (int('m), nat, vregidx, bits('m)) -> unit
function write_single_element(EEW, index, vrid, value) = {
  let 'elem_per_reg = VLEN / EEW;
  assert('elem_per_reg > 0);
  let real_vrid  : vregidx = vregidx_offset(vrid, to_bits_unsafe(5, index / 'elem_per_reg));
  let real_index : int    = index % 'elem_per_reg;

  let vrid_val : vector('elem_per_reg, bits('m)) = read_single_vreg('elem_per_reg, EEW, real_vrid);
  var r : vregtype = zeros();
  foreach (i from ('elem_per_reg - 1) downto 0) {
    r = r << EEW;
    if i == real_index then {
      r = r | zero_extend(value);
    } else {
      r = r | zero_extend(vrid_val[i]);
    }
  };
  V(real_vrid) = r;
}

/* Mask register reading operation with num_elem as max(VLMAX,VLEN/SEW)) */
val read_vmask : forall 'n, 'n > 0. (int('n), bits(1), vregidx) -> bits('n)
function read_vmask(num_elem, vm, vrid) = {
  assert(num_elem <= sizeof(vlenmax));
  let vreg_val : vregtype = V(vrid);
  var result   : bits('n) = ones();

  if vm == 0b1 then {
    return result
  };

  foreach (i from 0 to (num_elem - 1)) {
    result[i] = vreg_val[i]
  };

  result
}

/* This is a special version of read_vmask for carry/borrow instructions, where vm=1 means no carry */
val read_vmask_carry : forall 'n, 'n > 0. (int('n), bits(1), vregidx) -> bits('n)
function read_vmask_carry(num_elem, vm, vrid) = {
  assert(num_elem <= sizeof(vlenmax));
  let vreg_val : vregtype = V(vrid);
  var result   : bits('n) = zeros();

  if vm == 0b1 then {
    return result
  };

  foreach (i from 0 to (num_elem - 1)) {
    result[i] = vreg_val[i]
  };

  result
}

/* Mask register writing operation with num_elem as max(VLMAX,VLEN/SEW)) */
val write_vmask : forall 'n, 'n > 0. (int('n), vregidx, bits('n)) -> unit
function write_vmask(num_elem, vrid, v) = {
  assert(0 < VLEN & VLEN <= sizeof(vlenmax));
  assert(0 < num_elem & num_elem <= VLEN);
  let vreg_val : vregtype = V(vrid);
  var result   : vregtype = undefined;

  foreach (i from 0 to (num_elem - 1)) {
    result[i] = v[i]
  };
  foreach (i from num_elem to (VLEN - 1)) {
    /* Mask tail is always agnostic */
    result[i] = vreg_val[i] /* TODO: configuration support */
  };

  V(vrid) = result
}

/* end vector register */
