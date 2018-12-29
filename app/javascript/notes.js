import axios from 'axios'

let api = '/api/v1/notes/'


export default {
  list: [],

  load() {
    axios.get(api + '?' + Math.random().toString())
      .then(response => {
        this.list = response.data.payload;
      });
  },

  search(term) {
    // check if a search term is given.
    if (term == '') {
      return this.load();
    }

    // do the search
    axios.get(api + 'search/?term=' + term + '&' + Math.random().toString())
      .then(response => {
        this.list = response.data.payload;
      })
      .catch(error => {
        if (error.response.data.message) {
          // show the error message from the api.
          alert(error.response.data.message);
        } else {
          alert('Failed');
        }
      })
  },

  update(index) {
    // Check if we have an existing entry
    if (this.list[index].created_at) {
      // Update
      axios.put(api + this.list[index].id.toString(), this.list[index])
        .then(response => {
          this.list[index].dirty = false;

          this.updateTags(index);
        });
    } else {
      // Post new entry
      axios.post(api, this.list[index])
        .then(response => {
          // Replace existing entry with response from rails. This will
          // update the fields id, dirty, created_at and modified_at which
          // are not editable. To do so, we have to save the tags, and
          // later set them again.
          let tags = this.list[index].tags;
          this.list[index] = response.data.payload;

          this.list[index].tags = tags;
          this.updateTags(index);
        })
        .catch(error => {
          // This might need to be handled correct.
          alert('Failed')
        });
    }
  },

  updateTags(index) {
    if (this.list[index].tags && (this.list[index].tags.length > 0)) {
      axios.post(api + '/' + this.list[index].id + '/tags?' + Math.random().toString(), {tags:this.list[index].tags})
    }
  },

  delete(index) {
    // Check if we have an existing entry
    if (this.list[index].created_at) {
      axios.delete(api + this.list[index].id.toString())
        .catch(error => {
          // This might need to be handled correct.
          alert('Failed')
        });
    }
    this.list.splice(index, 1);
  }
}
