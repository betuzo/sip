package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(DependenciaPersonalController)
@Mock(DependenciaPersonal)
class DependenciaPersonalControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/dependenciaPersonal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.dependenciaPersonalInstanceList.size() == 0
        assert model.dependenciaPersonalInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.dependenciaPersonalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.dependenciaPersonalInstance != null
        assert view == '/dependenciaPersonal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/dependenciaPersonal/show/1'
        assert controller.flash.message != null
        assert DependenciaPersonal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaPersonal/list'


        populateValidParams(params)
        def dependenciaPersonal = new DependenciaPersonal(params)

        assert dependenciaPersonal.save() != null

        params.id = dependenciaPersonal.id

        def model = controller.show()

        assert model.dependenciaPersonalInstance == dependenciaPersonal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaPersonal/list'


        populateValidParams(params)
        def dependenciaPersonal = new DependenciaPersonal(params)

        assert dependenciaPersonal.save() != null

        params.id = dependenciaPersonal.id

        def model = controller.edit()

        assert model.dependenciaPersonalInstance == dependenciaPersonal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaPersonal/list'

        response.reset()


        populateValidParams(params)
        def dependenciaPersonal = new DependenciaPersonal(params)

        assert dependenciaPersonal.save() != null

        // test invalid parameters in update
        params.id = dependenciaPersonal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/dependenciaPersonal/edit"
        assert model.dependenciaPersonalInstance != null

        dependenciaPersonal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/dependenciaPersonal/show/$dependenciaPersonal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        dependenciaPersonal.clearErrors()

        populateValidParams(params)
        params.id = dependenciaPersonal.id
        params.version = -1
        controller.update()

        assert view == "/dependenciaPersonal/edit"
        assert model.dependenciaPersonalInstance != null
        assert model.dependenciaPersonalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/dependenciaPersonal/list'

        response.reset()

        populateValidParams(params)
        def dependenciaPersonal = new DependenciaPersonal(params)

        assert dependenciaPersonal.save() != null
        assert DependenciaPersonal.count() == 1

        params.id = dependenciaPersonal.id

        controller.delete()

        assert DependenciaPersonal.count() == 0
        assert DependenciaPersonal.get(dependenciaPersonal.id) == null
        assert response.redirectedUrl == '/dependenciaPersonal/list'
    }
}
