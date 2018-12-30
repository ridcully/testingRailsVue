<template>
  <div>
    <div v-if="note" class="form-group">
      <label for="title">Title</label>
      <input class="form-control" type="text" v-model="note.Title" name="title" placeholder="Your note title." @keyup="onModified()" />
      <label>Tags</label>
      <input v-model="tags" class="form-control" type="text" name="tags" placeholder="Your tags. (Comma seperated)" @keyup="onModified()" />
      <label for="note">Note</label>
      <textarea class="form-control" name="note" v-model="note.Note" placeholder="Your note." rows="6" @keyup="onModified()"></textarea>
      <label for="note">Link</label>
      <input class="form-control" type="text" v-model="note.Link" name="link" placeholder="Your note link." @keyup="onModified()" />
      <small v-if="note.Link"><a :href="note.Link" target="blank">Vist {{note.Link}}</a></small><br />
      <label for="note">Geolocation</label>
      <div class="row">
        <div class="col-10">
          <input class="form-control" type="text" v-model="coordinates" id="coordinates" name="coordinates" />
        </div>
        <div class="col-2">
          <button type="button" name="reloadCoordinates" class="btn btn-primary" @click="updateLocation()">&#10227;</button>
        </div>
      </div>
      <hr />
      <span v-if="note.created_at">
        <small>Created: {{ note.created_at }}</small><br>
        <small>Updated: {{ note.updated_at }}</small><br>
        <hr />
      </span>
      <div class="text-right">
        <button @click="onDelete()" class="btn btn-danger">Delete Note</button>
        <button @click="onSave()" class="btn btn-primary">Save Note</button>
      </div>
    </div>
    <div v-else>
      <h3>&larr; No note selected</h3>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Note',
  props: ['note'],
  computed: {
    tags: {
      get: function() {
        let all = [];
        for (let i in this.note.tags) {
          all.push(this.note.tags[i].Name);
        }

        return all.join(',');
      },
      set: function(tags) {
        let out = [];
        let all = tags.split(',')

        for (let i in all) {
          out.push({Name: all[i]});
        }
        this.note.tags = out;

        this.onModified();
      }
    },
    coordinates: {
      get: function() {
        if (!this.note.location) {
          return '';
        }
        return this.note.location.Latitude + ',' + this.note.location.Longitude;
      },
      set: function(val) {
        if (!val) {
          return;
        }
        if (!this.note.location) {
          this.note.location = {};
        }

        let temp = val.split(',');
        if (temp[0] && (temp[0] != '')) {
          this.note.location.Latitude = temp[0];
        }
        if (temp[1] && (temp[1] != '')) {
          this.note.location.Longitude = temp[1];
        }

        this.note.dirty = true;
        this.reload();
      }
    }
  },
  methods: {
    reload() {
      // This is somehow a hack. But it works.
      let i = this.$parent.index;
      this.$parent.changeNote(-1);

      let t = this;
      setTimeout(function() {t.$parent.changeNote(i);}, 10);
    },
    onDelete() {
      this.$emit('note-delete');
    },
    onSave() {
      this.$emit('note-save');
    },
    onModified() {
      this.note.dirty = true;
    },
    updateLocation() {
      if (!navigator.geolocation) {
        alert('Geolocation not supported!');
        return
      }

      navigator.geolocation.getCurrentPosition((position) => {
        this.coordinates = position.coords.latitude + ',' + position.coords.longitude;
      });
    }
  }
}
</script>
