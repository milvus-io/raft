/*
 * Copyright (c) 2023, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * NOTE: this file is generated by ivf_flat_00_generate.py
 *
 * Make changes there and run in this directory:
 *
 * > python ivf_flat_00_generate.py
 *
 */

#include <raft/neighbors/ivf_flat-inl.cuh>

#define instantiate_raft_neighbors_ivf_flat_reconstruct(T, IdxT)           \
  template void raft::neighbors::ivf_flat::reconstruct_batch<T, IdxT>(     \
    raft::resources const& handle,                                         \
    const raft::neighbors::ivf_flat::index<T, IdxT>& idx,                  \
    raft::device_vector_view<const IdxT, IdxT> vector_ids,                 \
    raft::device_matrix_view<T, IdxT, row_major> vector_out);              \
                                                                           \
  template void raft::neighbors::ivf_flat::reconstruct_list_data<T, IdxT>( \
    raft::resources const& handle,                                         \
    const raft::neighbors::ivf_flat::index<T, IdxT>& idx,                  \
    raft::device_matrix_view<T, IdxT, row_major> out_vectors,              \
    IdxT label,                                                            \
    IdxT offset);

instantiate_raft_neighbors_ivf_flat_reconstruct(uint8_t, int64_t);

#undef instantiate_raft_neighbors_ivf_flat_reconstruct
