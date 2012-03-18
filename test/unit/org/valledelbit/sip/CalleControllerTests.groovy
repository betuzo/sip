package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(CalleController)
@Mock(Calle)
class CalleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/calle/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.calleInstanceList.size() == 0
        assert model.calleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.calleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.calleInstance != null
        assert view == '/calle/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/calle/show/1'
        assert controller.flash.message != null
        assert Calle.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/calle/list'


        populateValidParams(params)
        def calle = new Calle(params)

        assert calle.save() != null

        params.id = calle.id

        def model = controller.show()

        assert model.calleInstance == calle
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/calle/list'


        populateValidParams(params)
        def calle = new Calle(params)

        assert calle.save() != null

        params.id = calle.id

        def model = controller.edit()

        assert model.calleInstance == calle
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/calle/list'

        response.reset()


        populateValidParams(params)
        def calle = new Calle(params)

        assert calle.save() != null

        // test invalid parameters in update
        params.id = calle.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/calle/edit"
        assert model.calleInstance != null

        calle.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/calle/show/$calle.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        calle.clearErrors()

        populateValidParams(params)
        params.id = calle.id
        params.version = -1
        controller.update()

        assert view == "/calle/edit"
        assert model.calleInstance != null
        assert model.calleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/calle/list'

        response.reset()

        populateValidParams(params)
        def calle = new Calle(params)

        assert calle.save() != null
        assert Calle.count() == 1

        params.id = calle.id

        controller.delete()

        assert Calle.count() == 0
        assert Calle.get(calle.id) == null
        assert response.redirectedUrl == '/calle/list'
    }
}
