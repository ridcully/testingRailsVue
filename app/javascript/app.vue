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
            <NotebookList @note-change="changeNote" @note-new="newNote" :notes="notes" :activeNote="index" />
          </div>
          <div class="col-7">
            <Note @note-save="saveNote" @note-delete="deleteNote" :note="notes[index]" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NotebookList from './comp.list'
import Note from './comp.note'

export default {
  name: 'app',
  components: {
    NotebookList,
    Note
  },
  data: () => ({
    notes: [],
    index: 0
  }),
  methods: {
    newNote () {
      this.notes.push({
        title: '',
        note: ''
      })
      this.index = this.notes.length - 1
    },
    changeNote (index) {
      this.index = index
    },
    saveNote () {
      // nothing as of yet
    },
    deleteNote () {
      this.notes.splice(this.index, 1)
      this.index = Math.max(this.index - 1, 0)
    }
  }
}
</script>

<style>
#notelist {
  overflow-y: auto;
  height: 400px;
}
</style>
