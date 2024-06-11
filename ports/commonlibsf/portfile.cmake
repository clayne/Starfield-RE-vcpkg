
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO Starfield-Reverse-Engineering/CommonLibSF
  REF a3ff963ef99d2fa6d7df5b587f1b5f8786a938ad
  SHA512 C6D73A2DCAB7374C1454AF8C328D669B167730821F6966A260AA34EF9D628C253C0CB88C3A7C4F6D76E63B0C07A27555110A2A7DAE488C98EC9A3E08A818FFC9
  HEAD_REF main)
 
set(VCPKG_POLICY_EMPTY_PACKAGE enabled)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_install_cmake()
vcpkg_cmake_config_fixup(
  PACKAGE_NAME CommonLibSF 
  CONFIG_PATH lib/cmake)
vcpkg_copy_pdbs()

file(GLOB CMAKE_CONFIGS "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF/*.cmake")
file(INSTALL ${CMAKE_CONFIGS} DESTINATION "${CURRENT_PACKAGES_DIR}/share/CommonLibSF")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/CommonLibSF/CommonLibSF")

file(
  INSTALL "${SOURCE_PATH}/COPYING"
  DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}"
  RENAME copyright)
