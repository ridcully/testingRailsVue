<template>
  <div class="containter">
    <div class="row">
      <div class="col-12 text-center">
        <h1><small class="text-muted">Rails on</small> Notes</h1>
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
  </div>
</template>

<script>
import NotebookList from './comp.list'
import Note from './comp.note'
import Notes from 'notes'

export default {
  name: 'app',
  components: {
    NotebookList,
    Note
  },
  data: () => ({
    notes: Notes,
    index: 0
  }),
  methods: {
    newNote() {
      this.notes.list.push({
        title: '',
        note: '',
        dirty: true,
      })
      this.index = this.notes.list.length - 1
    },
    changeNote(index) {
      this.index = index
    },
    saveNote() {
      this.notes.update(this.index)
    },
    deleteNote() {
      this.notes.delete(this.index)
      if (this.index > this.notes.list.length) {
        this.index = this.notes.list.length
      }
    }
  },
  beforeMount() {
    this.notes.load();
  }
}
</script>

<style>
#notelist {
  overflow-y: auto;
  height: 430px;
}
</style>
