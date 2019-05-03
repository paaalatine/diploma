FONTS_DIR = fonts
SOURCE_DIR = src
BUILD_DIR = build
STYLES_DIR = styles
ALL_TARGET_FILE = $(BUILD_DIR)/all.tex
NOTE_TARGET_FILE = $(BUILD_DIR)/note.tex
TASK_FILE = $(SOURCE_DIR)/main-task.tex
IMG_DIR = images

install_deps:
	sudo add-apt-repository ppa:jonathonf/texlive
	sudo apt update && sudo apt install texlive-full
	sudo apt-get install texlive-lang-cyrillic

install_fonts:
	sudo cp -r $(FONTS_DIR)/* /usr/local/share/fonts/
	fc-cache -f -v
	@echo "Fonts installed"
all:
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/$(IMG_DIR)
	cp -r $(SOURCE_DIR)/* $(BUILD_DIR)
	cp $(STYLES_DIR)/* $(BUILD_DIR)
	xelatex -output-directory=$(BUILD_DIR) $(ALL_TARGET_FILE) 
	bibtex $(BUILD_DIR)/all
	xelatex -output-directory=$(BUILD_DIR) $(ALL_TARGET_FILE) 
	xelatex -output-directory=$(BUILD_DIR) $(ALL_TARGET_FILE) 
# Do not modify this target.

note:
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/$(IMG_DIR)
	cp -r $(SOURCE_DIR)/* $(BUILD_DIR)
	cp $(STYLES_DIR)/* $(BUILD_DIR)
	xelatex -output-directory=$(BUILD_DIR) $(NOTE_TARGET_FILE) 
	bibtex $(BUILD_DIR)/note
	xelatex -output-directory=$(BUILD_DIR) $(NOTE_TARGET_FILE) 
	xelatex -output-directory=$(BUILD_DIR) $(NOTE_TARGET_FILE) 
# Do not modify this target.

task:
	mkdir -p $(BUILD_DIR)
	xelatex -output-directory=$(BUILD_DIR) $(TASK_FILE) 

