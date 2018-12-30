<template>
  <div class="containter">
    <div class="row">
      <div class="col-12 text-center">
        <h1><small class="text-muted">Rails on</small> Notes</h1>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-sm-12" id="app">
        <p>
          <Search :search="searchTerm" @note-search="searchNote" />
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-8 offset-lg-2 col-md-10 offset-md-1 col-sm-12" id="app">
        <div class="row">
          <div class="col-5" id="notelist">
            <NotebookList @note-change="changeNote" @note-new="newNote" :notes="notes.list" :activeNote="index" />
          </div>
          <div class="col-7">
            <Note @note-save="saveNote()" @note-delete="deleteNote" :note="notes.list[index]" />
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12 text-center">
        HotKeys: <span class="badge badge-warning">KeyUp</span> + <span class="badge badge-warning">KeyDown</span> + <span class="badge badge-warning">+</span>
      </div>
    </div>
  </div>
</template>

<script>
import Search from './comp.search'
import NotebookList from './comp.list'
import Note from './comp.note'
import Notes from 'notes'

export default {
  name: 'app',
  components: {
    Search,
    NotebookList,
    Note
  },
  data: () => ({
    notes: Notes,
    index: 0,
    searchTerm: ''
  }),
  mounted() {
    // install key listener for hotskeys
    var vm = this;
    window.addEventListener('keyup', function(event) {
      // Check for elements, that do not listen to our hot keys
      if (["INPUT", "TEXTAREA"].indexOf(document.activeElement.tagName) >= 0 ) {
        return;
      }
      // check key down
      if (event.keyCode == 40) {
        vm.index++;
        if (vm.index >= vm.notes.list.length) {
          vm.index = vm.notes.list.length - 1;
        }
      }
      // check key up
      if (event.keyCode == 38) {
        vm.index--;
        if (vm.index < 0) {
          vm.index = 0;
        }
      }
      // check for +
      if (event.keyCode == 187) {
        vm.newNote();
      }
    });
  },
  beforeMount() {
    this.notes.load();
  },
  methods: {
    newNote() {
      this.notes.list.push({
        title: '',
        note: '',
        dirty: true,
      });
      this.index = this.notes.list.length - 1;
    },
    changeNote(index) {
      this.index = index;
    },
    saveNote() {
      this.notes.update(this.index);
    },
    deleteNote() {
      this.notes.delete(this.index);
      if (this.index > this.notes.list.length) {
        this.index = this.notes.list.length;
      }
    },
    searchNote(searchTerm) {
      this.searchTerm = searchTerm;
      this.notes.search(searchTerm);
    }
  }
}
</script>

<style>
#notelist {
  overflow-y: auto;
  height: 640px;
}
</style>
