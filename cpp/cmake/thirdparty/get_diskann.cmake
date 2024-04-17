#=============================================================================
# Copyright (c) 2024, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#=============================================================================

function(find_and_configure_diskann)
    set(oneValueArgs VERSION REPOSITORY PINNED_TAG)
    cmake_parse_arguments(PKG "${options}" "${oneValueArgs}"
            "${multiValueArgs}" ${ARGN} )

    rapids_cpm_find(diskann ${PKG_VERSION}
            GLOBAL_TARGETS diskann::diskann
            CPM_ARGS
            GIT_REPOSITORY   ${PKG_REPOSITORY}
            GIT_TAG          ${PKG_PINNED_TAG}
            )
endfunction()

if(NOT RAFT_DISKANN_GIT_TAG)
    set(RAFT_DISKANN_GIT_TAG cagra_int)
endif()

if(NOT RAFT_DISKANN_GIT_REPOSITORY)
    # set(RAFT_FAISS_GIT_REPOSITORY https://github.com/tarang-jain/DiskANN.git)
endif()

find_and_configure_diskann(VERSION 0.7.0
        REPOSITORY  ${RAFT_DISKANN_GIT_REPOSITORY}
        PINNED_TAG  ${RAFT_DISKANN_GIT_TAG})
