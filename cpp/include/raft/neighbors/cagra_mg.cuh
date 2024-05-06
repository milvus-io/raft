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

#pragma once

#include <raft/neighbors/ann_mg_types.hpp>
#include <raft/neighbors/detail/ann_mg.cuh>

namespace raft::neighbors::mg {

template <typename T, typename IdxT>
auto build(const raft::resources& handle,
           const cagra::dist_index_params& index_params,
           raft::host_matrix_view<const T, IdxT, row_major> index_dataset)
  -> detail::ann_mg_index<cagra::index<T, IdxT>, T, IdxT>
{
  return mg::detail::build<T, IdxT>(handle, index_params, index_dataset);
}

template <typename T, typename IdxT>
void search(const raft::resources& handle,
            const detail::ann_mg_index<cagra::index<T, IdxT>, T, IdxT>& index,
            const cagra::search_params& search_params,
            raft::host_matrix_view<const T, IdxT, row_major> query_dataset,
            raft::host_matrix_view<IdxT, IdxT, row_major> neighbors,
            raft::host_matrix_view<float, IdxT, row_major> distances)
{
  mg::detail::search<T, IdxT>(handle, index, search_params, query_dataset, neighbors, distances);
}

}  // namespace raft::neighbors::mg