package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(PuestoController)
@Mock(Puesto)
class PuestoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/puesto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.puestoInstanceList.size() == 0
        assert model.puestoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.puestoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.puestoInstance != null
        assert view == '/puesto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/puesto/show/1'
        assert controller.flash.message != null
        assert Puesto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/puesto/list'


        populateValidParams(params)
        def puesto = new Puesto(params)

        assert puesto.save() != null

        params.id = puesto.id

        def model = controller.show()

        assert model.puestoInstance == puesto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/puesto/list'


        populateValidParams(params)
        def puesto = new Puesto(params)

        assert puesto.save() != null

        params.id = puesto.id

        def model = controller.edit()

        assert model.puestoInstance == puesto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/puesto/list'

        response.reset()


        populateValidParams(params)
        def puesto = new Puesto(params)

        assert puesto.save() != null

        // test invalid parameters in update
        params.id = puesto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/puesto/edit"
        assert model.puestoInstance != null

        puesto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/puesto/show/$puesto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        puesto.clearErrors()

        populateValidParams(params)
        params.id = puesto.id
        params.version = -1
        controller.update()

        assert view == "/puesto/edit"
        assert model.puestoInstance != null
        assert model.puestoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/puesto/list'

        response.reset()

        populateValidParams(params)
        def puesto = new Puesto(params)

        assert puesto.save() != null
        assert Puesto.count() == 1

        params.id = puesto.id

        controller.delete()

        assert Puesto.count() == 0
        assert Puesto.get(puesto.id) == null
        assert response.redirectedUrl == '/puesto/list'
    }
}
