FetchContent_Declare(
  sdl3
  GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
  GIT_TAG release-3.2.14
)
FetchContent_MakeAvailable(sdl3)

FetchContent_Declare(
  sdl3_image
  GIT_REPOSITORY https://github.com/libsdl-org/SDL_image.git
  GIT_TAG release-3.2.4
)
FetchContent_MakeAvailable(sdl3_image)

FetchContent_Declare(
  sdl3_ttf
  GIT_REPOSITORY https://github.com/libsdl-org/SDL_ttf.git
  GIT_TAG release-3.2.2
)
FetchContent_MakeAvailable(sdl3_ttf)

FetchContent_Declare(
  sdl3_mixer
  GIT_REPOSITORY https://github.com/libsdl-org/SDL_mixer.git
  GIT_TAG main
)
FetchContent_MakeAvailable(sdl3_mixer)

# If you don't want SDL_ttf, then remove this section.
set(SDLTTF_VENDORED ON) # tell SDL_ttf to build its own dependencies

# SDL_mixer (used for playing audio)
set(SDLMIXER_MIDI_NATIVE OFF)
set(SDLMIXER_GME OFF)
set(SDLMIXER_WAVPACK OFF)
set(SDLMIXER_MOD OFF)
set(SDLMIXER_OPUS OFF)
set(SDLMIXER_VENDORED ON)   # tell SDL_mixer to build its own dependencies

# SDL_image (used for loading various image formats)
set(SDLIMAGE_VENDORED ON)
set(SDLIMAGE_AVIF OFF)
set(SDLIMAGE_BMP OFF)
set(SDLIMAGE_JPEG OFF)
set(SDLIMAGE_WEBP OFF)

target_link_libraries("${EXECUTABLE_NAME}" PRIVATE
  "${LIB_NAME}"
  SDL3_ttf::SDL3_ttf
  SDL3_mixer::SDL3_mixer
  SDL3_image::SDL3_image
  SDL3::SDL3
)
