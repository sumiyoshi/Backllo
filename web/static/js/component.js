import Api from 'api';
let api = new Api;

export default {
    name: 'Component',
    el: '#content',
    created: function () {
        this.$on('loadStatuses', this.loadStatuses);
        this.$on('loadIssues', this.loadIssues);

        this.$emit('loadStatuses')
    },
    data: {
        statuses: []
    },
    methods: {

        loadIssues: function (status, index) {
            let me = this;

            api.get('issues/' + status.id, {}, function (issues) {
                status['issues'] = issues;
                me.statuses.splice(index, 1, status);
            });
        },

        loadStatuses: function () {
            let me = this;

            api.get('statuses', {}, function (statuses) {
                me.statuses = statuses;

                statuses.map(function (status, index) {
                    me.$emit('loadIssues', status, index);
                });
            });
        }
    }
}