set(DOXYGEN_EXTRACT_ALL YES)
set(DOXYGEN_BUILTIN_STL_SUPPORT YES)

doxygen_add_docs(docs project/lib.hpp "${CAMKE_CURRENT_SOURCEDIR}/mainpage.md"
                WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}/include")
