package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(HabitanteController)
@Mock(Habitante)
class HabitanteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/habitante/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.habitanteInstanceList.size() == 0
        assert model.habitanteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.habitanteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.habitanteInstance != null
        assert view == '/habitante/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/habitante/show/1'
        assert controller.flash.message != null
        assert Habitante.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/habitante/list'


        populateValidParams(params)
        def habitante = new Habitante(params)

        assert habitante.save() != null

        params.id = habitante.id

        def model = controller.show()

        assert model.habitanteInstance == habitante
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/habitante/list'


        populateValidParams(params)
        def habitante = new Habitante(params)

        assert habitante.save() != null

        params.id = habitante.id

        def model = controller.edit()

        assert model.habitanteInstance == habitante
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/habitante/list'

        response.reset()


        populateValidParams(params)
        def habitante = new Habitante(params)

        assert habitante.save() != null

        // test invalid parameters in update
        params.id = habitante.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/habitante/edit"
        assert model.habitanteInstance != null

        habitante.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/habitante/show/$habitante.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        habitante.clearErrors()

        populateValidParams(params)
        params.id = habitante.id
        params.version = -1
        controller.update()

        assert view == "/habitante/edit"
        assert model.habitanteInstance != null
        assert model.habitanteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/habitante/list'

        response.reset()

        populateValidParams(params)
        def habitante = new Habitante(params)

        assert habitante.save() != null
        assert Habitante.count() == 1

        params.id = habitante.id

        controller.delete()

        assert Habitante.count() == 0
        assert Habitante.get(habitante.id) == null
        assert response.redirectedUrl == '/habitante/list'
    }
}
